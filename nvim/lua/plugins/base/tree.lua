return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		-- popup_border_style is for input and confirmation dialogs.
		-- Configurtaion of floating window is done in the individual source sections.
		-- "NC" is a special style that works well with NormalNC set
		-- For popup configuration see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup
		popup_border_style = "double", -- "double", "none", "rounded", "shadow", "single" or "solid"
		filesystem = {
			bind_to_cwd = false,
			follow_current_file = { enabled = true },
			filtered_items = {
				hide_dotfiles = false,
			},
		},
		window = {
			mappings = {
				["<space>"] = "none",
			},
		},
	},
	keys = {
		{
			"<leader>e",
			function()
				require("neo-tree.command").execute({ position = "float", reveal = true, toggle = true })
			end,
			desc = "Toggle NeoTree",
		},
		{
			"<leader>n",
			function()
				require("neo-tree.command").execute({ position = "left", toggle = true })
			end,
			desc = "Toggle NeoTree",
		},
		{
			"<leader>ng",
			function()
				require("neo-tree.command").execute({ source = "git_status", position = "float", toggle = true })
			end,
			desc = "Git Explorer",
		},
		{
			"<leader>b",
			function()
				require("neo-tree.command").execute({ source = "buffers", position = "float", toggle = true })
			end,
			desc = "Buffer Explorer",
		},
	},
}
