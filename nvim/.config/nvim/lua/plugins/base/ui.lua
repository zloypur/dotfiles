return {
	{
		"lunacookies/vim-colors-xcode",
		lazy = false,
		priority = 95, -- Ensure it loads first
		config = function()
			vim.opt.background = "light" -- light, dark
			vim.g.xcodelighthc_green_comments = 0
			vim.g.xcodelighthc_dim_punctuation = 0
			vim.g.xcodelighthc_match_paren_style = 1
			vim.cmd.colorscheme("xcodelighthc")
		end,
	},
	{
		"morhetz/gruvbox",
		lazy = false,
		priority = 95,
		config = function()
			vim.opt.background = "light" -- light, dark
			vim.g.gruvbox_contrast_dark = "soft" -- soft, medium, hard
			vim.g.gruvbox_contrast_light = "soft"
			vim.g.gruvbox_italic = 1
			-- vim.cmd.colorscheme("gruvbox")
		end,
	},
}
