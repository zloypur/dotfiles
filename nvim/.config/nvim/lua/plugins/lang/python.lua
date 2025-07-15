return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"python",
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				-- ls
				"pyright",

				-- tools
				"black",
				"isort",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				pyright = {},
			},
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				python = { "isort", "black" },
			},
		},
	},
}
