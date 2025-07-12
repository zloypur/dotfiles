return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			settings = {
				sync_on_toggle = true,
				sync_on_ui_close = true,
			},
		},
		keys = {
			{
				"<leader>ha",
				function()
					local harpoon = require("harpoon")
					harpoon:list():add()
				end,
				mode = "n",
			},
			{
				"<leader>hd",
				function()
					local harpoon = require("harpoon")
					harpoon:list():remove()
				end,
				mode = "n",
			},
			{
				"<leader>hs",
				function()
					local harpoon = require("harpoon")
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				mode = "n",
			},
			{
				"<C-S-P>",
				function()
					local harpoon = require("harpoon")
					harpoon:list():prev()
				end,
				mode = "n",
			},
			{
				"<C-S-N>",
				function()
					local harpoon = require("harpoon")
					harpoon:list():next()
				end,
				mode = "n",
			},
		},
	},
}
