require("neodev").setup {
    library = {
        plugins = {
            "nvim-dap-ui",
            "nvim-treesitter",
            "plenary.nvim",
            "telescope.nvim",
        },
        types = true,
    },

}

local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
    -- Java
    -- requires manual installation via Mason
    -- For debug: "java-test", "java-debug-adapter"
    -- For decompilation: vscode-java-decompiler
    "jdtls",

    -- Go
    "gopls",

    -- Rust
    "rust_analyzer",

    -- Python
    "pyright",

    -- JS/TS
    "tsserver",
    "eslint",

    -- Lua
    "lua_ls",
})

lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    local opts = { buffer = bufnr }

    vim.keymap.set('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.keymap.set('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.keymap.set('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.keymap.set('n', 'gt', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.keymap.set('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.keymap.set('n', 'gs', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.keymap.set('n', '<leader>cr', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.keymap.set({ 'n', 'x' }, '<leader>cf', '<Cmd>lua vim.lsp.buf.format({async = true})<CR>', opts)
    vim.keymap.set('n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)

    vim.keymap.set('n', 'gl', '<Cmd>lua vim.diagnostic.open_float()<CR>', opts)
    vim.keymap.set('n', '[d', '<Cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    vim.keymap.set('n', ']d', '<Cmd>lua vim.diagnostic.goto_next()<CR>', opts)

    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- Disable automatic jdtls setup
lsp.skip_server_setup({ 'jdtls' })

lsp.setup()

-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    mapping = {
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    }
})

vim.diagnostic.config({
    virtual_text = true,
})
