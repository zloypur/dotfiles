return {
	{
		"morhetz/gruvbox",
		lazy = false,
		priority = 95,
		config = function()
            vim.opt.background = "light"
            vim.g.gruvbox_contrast_dark = "soft" -- soft, medium, hard
            vim.g.gruvbox_contrast_light = "soft"
            vim.g.gruvbox_italic = 1
			vim.cmd.colorscheme("gruvbox")
		end,
	},
}
