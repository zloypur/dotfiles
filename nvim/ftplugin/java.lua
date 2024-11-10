local mason = require('mason-registry') -- for not it is required
local jdtls = require('jdtls')

-- These files is used to determine if current dir is a java project root
local root_files = {
    '.git',
    'mvnw',
    'gradlew',
    'pom.xml',
    'build.gradle',
}

local features = {
    -- change this to `true` to enable codelens
    codelens = true,

    -- change this to `true` if you have `nvim-dap`,
    -- `java-test` and `java-debug-adapter` installed
    debugger = true,
}

local vars_cache = {}

local java_cmds = vim.api.nvim_create_augroup('java_cmds', { clear = true })

local function jdtls_install_path()
    if vars_cache.jdtls_install_path ~= nil then
        return vars_cache.jdtls_install_path
    end

    local path = mason.get_package('jdtls'):get_install_path()

    vars_cache.jdtls_install_path = path

    return path
end

-- Path to JDT LS jar
local function jdtls_jar_path()
    return vim.fn.glob(jdtls_install_path() .. '/plugins/org.eclipse.equinox.launcher_*.jar')
end

-- Path to JDT LS config based on platform
local function platform_config_path()
    local os_name = ''
    if vim.fn.has('mac') == 1 then
        os_name = 'mac'
    elseif vim.fn.has('unix') == 1 then
        os_name = 'linux'
    elseif vim.fn.has('win32') == 1 then
        os_name ='win'
    end

    return jdtls_install_path() .. '/config_' .. os_name
end

-- Locate available 
local function configure_bundles()
    if vars_cache.bundles ~= nil then
        return vars_cache.bundles
    end

    local function get_mason_jar(package_name, jar_pattern)
        if not mason.has_package(package_name) then
            return nil
        end

        local install_path = mason.get_package(package_name):get_install_path()
        local jars = vim.split(install_path .. jar_pattern, '\n')
        if jars[1] ~= nil and jars[1] ~= '' then
            return jars[1]
        end

        return nil
    end

    local bundles = {}
    table.insert(bundles, get_mason_jar('java-test', '/extension/server/*.jar'))
    table.insert(bundles, get_mason_jar('java-debug-adapter', '/extension/server/com.microsoft.java.debug.plugin-*.jar'))

    vars_cache.bundles = bundles

    return bundles
end

local function configure_java_runtimes()
    -- Json format of java runtime configuration:
    --
    -- This example assume you are using sdkman: https://sdkman.io
    -- [
    --   {
    --     "name": "JavaSE-17",
    --     "path": "~/.sdkman/candidates/java/17.0.6-tem"
    --   },
    --   {
    --     "name": "JavaSE-18",
    --     "path": "~/.sdkman/candidates/java/18.0.2-amzn"
    --     "default": true
    --   }
    -- ]
    --
    -- Note: the field `name` must be a valid `ExecutionEnvironment`,
    -- you can find the list here:
    -- https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request

    if vars_cache.runtime_config ~= nil then
        return vars_cache.runtime_config
    end

    local default_java = os.getenv('JAVA_HOME')
    local runtime_config_path = vim.fn.getcwd() .. '/.nvim/java_runtime.json'

    local config = {}
    if vim.fn.filereadable(runtime_config_path) == 1 then
        local raw_config = vim.fn.json_decode(vim.fn.readfile(runtime_config_path))
        for _, runtime in pairs(raw_config) do
            table.insert(
                config,
                {
                    name = runtime.name,
                    path = vim.fn.expand(runtime.path),
                    default = runtime.default,
                }
            )
        end
    elseif default_java ~= nil then
        table.insert(
            config
            {
                name = 'Default',
                path = vim.fn.expand(default_java),
                default = true,
            }
        )
    end

    vars_cache.runtime_config = config

    return config
end

local function configure_language_server_capabilities()
    if vars_cache.language_server_capabilities ~= nil then
        return vars_cache.language_server_capabilities
    end

    jdtls.extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

    local ok_cmp, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
    local capabilities = vim.tbl_deep_extend(
        'force',
        vim.lsp.protocol.make_client_capabilities(),
        ok_cmp and cmp_lsp.default_capabilities() or {}
    )

    vars_cache.capabilities = capabilities

    return capabilities
end

local function enable_codelens(bufnr)
    pcall(vim.lsp.codelens.refresh)

    vim.api.nvim_create_autocmd('BufWritePost', {
        buffer = bufnr,
        group = java_cmds,
        desc = 'refresh codelens',
        callback = function()
            pcall(vim.lsp.codelens.refresh)
        end,
    })
end

local function enable_debugger(bufnr)
    jdtls.setup_dap({ hotcodereplace = 'auto' })
    require('jdtls.dap').setup_dap_main_class_configs()

    local opts = { buffer = bufnr }
    vim.keymap.set('n', '<leader>dtc', "<cmd>lua require('jdtls').test_class()<cr>", opts)
    vim.keymap.set('n', '<leader>dtn', "<cmd>lua require('jdtls').test_nearest_method()<cr>", opts)
end

local function jdtls_on_attach(client, bufnr)
    if features.debugger then
        enable_debugger(bufnr)
    end

    if features.codelens then
        enable_codelens(bufnr)
    end

    -- The following mappings are based on the suggested usage of nvim-jdtls
    -- https://github.com/mfussenegger/nvim-jdtls#usage

    local opts = { buffer = bufnr }
    vim.keymap.set('n', '<leader>cri', "<cmd>lua require('jdtls').organize_imports()<cr>", opts)
    vim.keymap.set('n', '<leader>crv', "<cmd>lua require('jdtls').extract_variable()<cr>", opts)
    vim.keymap.set('x', '<leader>crv', "<esc><cmd>lua require('jdtls').extract_variable(true)<cr>", opts)
    vim.keymap.set('n', '<leader>crc', "<cmd>lua require('jdtls').extract_constant()<cr>", opts)
    vim.keymap.set('x', '<leader>crc', "<esc><cmd>lua require('jdtls').extract_constant(true)<cr>", opts)
    vim.keymap.set('x', '<leader>crm', "<esc><Cmd>lua require('jdtls').extract_method(true)<cr>", opts)
end

-- All project's related data that required by JDT LS will be stored here
local function jdtls_project_cache_dir()
    return vim.fn.stdpath('cache') .. '/nvim-jdtls/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
end

local function java_project_root()
    return vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1])
end

local function setup_jdtls()
    local language_server_capabilities = configure_language_server_capabilities()

    local project_root = java_project_root()

    local bundles = configure_bundles()

    local runtimes = configure_java_runtimes()

    -- The command that starts the language server
    -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    local cmd = {
        -- 💀
        'java',

        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
--        '-javaagent:' .. <java-agent-path>, -- if you need lombok pass lombok jar here (mason's jdtls has lombok jar)
        '-Xms1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        -- Fix google format
        '--add-exports', 'jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED',
        '--add-exports', 'jdk.compiler/com.sun.tools.javac.code=ALL-UNNAMED',
        '--add-exports', 'jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED',
        '--add-exports', 'jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED',
        '--add-exports', 'jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED',
        '--add-exports', 'jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED',

        -- 💀
        '-jar',
        jdtls_jar_path(),

        -- 💀
        '-configuration',
        platform_config_path(),

        -- 💀
        '-data',
        jdtls_project_cache_dir(),
    }

    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    local lsp_settings = {
        java = {
            -- jdt = {
            --   ls = {
            --     vmargs = "-XX:+UseParallelGC -XX:GCTimeRatio=4 -XX:AdaptiveSizePolicyWeight=90 -Dsun.zip.disableMemoryMapping=true -Xmx1G -Xms100m"
            --   }
            -- },
            server = {
                launchMode = 'Standard',
            },
            eclipse = {
                downloadSources = true,
            },
            configuration = {
                updateBuildConfiguration = 'interactive',
                runtimes = runtimes,
            },
            maven = {
                downloadSources = true,
            },
            implementationsCodeLens = {
                enabled = true,
            },
            referencesCodeLens = {
                enabled = true,
            },
            -- inlayHints = {
            --   parameterNames = {
            --     enabled = 'all' -- literals, all, none
            --   }
            -- },
            format = {
                enabled = true,
                insertSpaces = true,
                tabSize = 2,
                -- settings = {
                --     url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml"
                --     profile = 'GoogleStyle',
                -- },
            }
        },
        signatureHelp = {
            enabled = true,
        },
        completion = {
            collapseCompletionItems = true,
            chain = {
                enabled = true,
            },
            favoriteStaticMembers = {
                'org.hamcrest.MatcherAssert.assertThat',
                'org.hamcrest.Matchers.*',
                'org.hamcrest.CoreMatchers.*',
                'org.junit.jupiter.api.Assertions.*',
                'java.util.Objects.requireNonNull',
                'java.util.Objects.requireNonNullElse',
                'org.mockito.Mockito.*',
            },
        },
        contentProvider = {
            preferred = 'fernflower',
        },
        extendedClientCapabilities = jdtls.extendedClientCapabilities,
        sources = {
            organizeImports = {
                starThreshold = 9999,
                staticStarThreshold = 9999,
            }
        },
        codeGeneration = {
            toString = {
                template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}',
            },
            useBlocks = true,
        },
    }

    -- This starts a new client & server,
    -- or attaches to an existing client & server depending on the `root_dir`.
    jdtls.start_or_attach({
        cmd = cmd,
        settings = lsp_settings,
        on_attach = jdtls_on_attach,
        capabilities = language_server_capabilities,
        root_dir = project_root,
        flags = {
            allow_incremental_sync = true,
        },
        init_options = {
            bundles = bundles,
        },
    })
end

-- Setup LS
setup_jdtls()

