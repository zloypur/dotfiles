return {
	{
		"morhetz/gruvbox",
		lazy = false,
		priority = 95,
		config = function()
			vim.opt.background = "dark" -- light, dark
			vim.g.gruvbox_contrast_dark = "soft" -- soft, medium, hard
			vim.g.gruvbox_contrast_light = "soft"
			vim.g.gruvbox_italic = 1
			-- vim.cmd.colorscheme("gruvbox")
		end,
	},
	{
		"aliqyan-21/darkvoid.nvim",
		lazy = false,
		priority = 95,
		config = function()
			require("darkvoid").setup({
				colors = {
					string = "#f1f1f1",
				},
			})
			vim.cmd.colorscheme("darkvoid")
		end,
	},
}
