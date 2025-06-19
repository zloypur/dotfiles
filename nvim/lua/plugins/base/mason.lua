return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts_extend = { "ensure_installed" },
		opts = {
			ensure_installed = {},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts_extend = { "ensure_installed" },
		opts = {
			ensure_installed = {},
		},
	},
}
