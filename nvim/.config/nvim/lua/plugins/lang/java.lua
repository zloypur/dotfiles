return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"java",
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				-- ls
				"jdtls",

				-- tools
				"java-test",

				-- debugger
				"java-debug-adapter",
			},
		},
	},
	{
		"mfussenegger/nvim-jdtls",
		dependencies = { "mfussenegger/nvim-dap", "neovim/nvim-lspconfig" },
		config = function()
			local function get_package_files(package, pattern)
				local mason_root = require("mason.settings").current.install_root_dir

				local package_path = mason_root .. "/packages/" .. package .. "/" .. pattern
				local files = vim.split(vim.fn.glob(package_path), "\n")
				if files[1] ~= "" then
					return files
				end

				return {}
			end

			local function start_or_attach()
				local jdtls = require("jdtls")
				local dap = require("jdtls.dap")

				local project_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" })

				local cache_dir = vim.fn.stdpath("cache") .. "/nvim/jdtls"
				local project_data_dir = cache_dir .. "/" .. vim.fn.fnamemodify(project_dir, ":p:h:t")

				local bundles = {}
				local test_bundle = get_package_files("java-test", "extension/server/*.jar")
				for _, v in ipairs(test_bundle) do
					table.insert(bundles, v)
				end
				local debug_bundle = get_package_files("java-debug-adapter", "extension/server/*.jar")
				for _, v in ipairs(debug_bundle) do
					table.insert(bundles, v)
				end

				local config = {
					cmd = {
						"jdtls",

						"-data",
						project_data_dir,
					},
					settings = {
						extendedClientCapabilities = jdtls.extendedClientCapabilities,
					},
					init_options = {
						bundles = bundles,
					},
					root_dir = project_dir,
					on_attach = function(client, bufrn)
						-- Setup DAP
						jdtls.setup_dap({ hotcodereplace = "auto" })
						dap.setup_dap_main_class_configs()

						-- Keymaps
						local opts = { buffer = bufrn }

						-- stylua: ignore start
						vim.keymap.set("n", "<leader>cri", "<CMD>lua require('jdtls').organize_imports()<CR>", opts)
						vim.keymap.set("n", "<leader>crv", "<CMD>lua require('jdtls').extract_variable()<CR>", opts)
						vim.keymap.set("x", "<leader>crv", "<ESC><CMD>lua require('jdtls').extract_variable(true)<CR>", opts)
						vim.keymap.set("n", "<leader>crc", "<CMD>lua require('jdtls').extract_constant<CR>", opts)
						vim.keymap.set("x", "<leader>crc", "<ESC><CMD>lua require('jdtls').extract_constant(true)<CR>", opts)
						vim.keymap.set("x", "<leader>crm", "<ESC><CMD>lua require('jdtls').extract_method(true)<CR>", opts)
						vim.keymap.set("n", "<leader>df",  "<CMD>lua require('jdtls').test_class()<CR>", opts)
						vim.keymap.set("n", "<leader>dt",  "<CMD>lua require('jdtls').test_nearest_method()<CR>", opts)
						-- stylua: ignore end
					end,
				}

				jdtls.start_or_attach(config)
			end

			-- Autocmd
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "java" },
				callback = start_or_attach,
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {},
		},
	},
}
