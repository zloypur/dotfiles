return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"terraform",
				"hcl",
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				-- ls
				-- "terraform-ls", -- install manually
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				terraformls = {},
			},
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				terraform = { "terraform fmt" },
			},
		},
	},
}
