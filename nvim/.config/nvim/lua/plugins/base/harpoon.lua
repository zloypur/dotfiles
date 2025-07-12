local function get_harpoon_selector(index)
	return function()
		require("harpoon"):list():select(index)
	end
end

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
				"<leader>a",
				function()
					require("harpoon"):list():add()
				end,
				mode = "n",
			},
			{
				"<leader>d",
				function()
					require("harpoon"):list():remove()
				end,
				mode = "n",
			},
			{
				"<leader>h",
				function()
					local harpoon = require("harpoon")
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				mode = "n",
			},
			{
				"<leader>1",
				get_harpoon_selector(1),
				mode = "n",
			},
			{
				"<leader>2",
				get_harpoon_selector(2),
				mode = "n",
			},
			{
				"<leader>3",
				get_harpoon_selector(3),
				mode = "n",
			},
			{
				"<leader>4",
				get_harpoon_selector(4),
				mode = "n",
			},
			{
				"<leader>5",
				get_harpoon_selector(5),
				mode = "n",
			},
		},
	},
}
