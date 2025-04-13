return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
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
