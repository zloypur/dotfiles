return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"markdown",
				"markdown_inline",
				"html",
				"latex",
				"yaml",
			},
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-mini/mini.icons",
		},
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			completions = {
				lsp = {
					enabled = true,
				},
			},
		},
		keys = {
			{
				"<leader>m",
				"<cmd>RenderMarkdown buf_toggle<cr>",
				desc = "Toggle markdown buffer preview",
			},
		},
	},
}
