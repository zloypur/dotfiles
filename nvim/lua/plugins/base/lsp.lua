return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			"saghen/blink.cmp",
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			local clientCapabilities = vim.lsp.protocol.make_client_capabilities()

			local blink = require("blink.cmp")
			local capabilities = blink.get_lsp_capabilities(clientCapabilities)

			-- autoinstall of LSPs via mason-lspconfig is disabled in favor of installation
			-- via mason-tool-installer
			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup({
				ensure_installed = {}, -- explicitly set to an empty table
				automatic_installation = false,
			})

			for server, serverOpts in pairs(opts.servers) do
				serverOpts.capabilities = capabilities
				lspconfig[server].setup(serverOpts)
			end
		end,
	},
	{
		"jmbuhr/otter.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xq",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			format_on_save = {
				-- I recommend these options. See :help conform.format for details.
				lsp_format = "fallback",
				timeout_ms = 500,
			},
		},
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
	},
	{
		"smjonas/inc-rename.nvim",
		cmd = "IncRename",
		opts = {},
		keys = {
			{
				"<leader>cr",
				function()
					return ":IncRename " .. vim.fn.expand("<cword>")
				end,
				expr = true,
			},
		},
		config = function(opts)
			require("inc_rename").setup(opts)
		end,
	},
}
