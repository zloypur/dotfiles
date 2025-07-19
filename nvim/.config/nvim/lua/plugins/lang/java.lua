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
						bundles = {
							table.unpack(get_package_files("java-test", "extension/server/*.jar")),
							table.unpack(get_package_files("java-debug-adapter", "extension/server/*.jar")),
						},
					},
					root_dir = project_dir,
					on_attach = function(client, bufrn)
						--
						-- Setup DAP
						jdtls.setup_dap({ hotcodereplace = "auto" })
						dap.setup_dap_main_class_configs()

						local opts = { buffer = bufnr }
						-- vim.keymap.set("n", "<leader>dt", "<cmd>lua require('jdtls').test_class()<cr>", opts)
						vim.keymap.set("n", "<leader>dt", jdtls.test_nearest_method, opts)
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
