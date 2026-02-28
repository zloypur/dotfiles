return {
	{
		"mason-org/mason.nvim",
		version = "v2.2.1",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		version = "v2.2.1",
		opts_extend = { "ensure_installed" },
		opts = {
			automatic_enable = false,
			ensure_installed = {},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts_extend = { "ensure_installed" },
		opts = {
			ensure_installed = {},
			integrations = {
				["mason-lspconfig"] = false,
				["mason-null-ls"] = false,
				["mason-nvim-dap"] = false,
			},
		},
	},
}
