return {
	{
		"nvim-mini/mini.ai",
		version = "*",
		opts = {},
	},
	{
		"nvim-mini/mini.splitjoin",
		version = "*",
		opts = {
			mappings = {
				toggle = "<leader>ss",
			},
		},
	},
	{
		"nvim-mini/mini.surround",
		version = "*",
		opts = {
			mappings = {
				-- add = "<leader>sa", -- Add surrounding in Normal and Visual modes
				-- delete = "<leader>sd", -- Delete surrounding
				-- find = "<leader>sf", -- Find surrounding (to the right)
				-- find_left = "<leader>sF", -- Find surrounding (to the left)
				-- highlight = "<leader>sh", -- Highlight surrounding
				-- replace = "<leader>sr", -- Replace surrounding
				--
				-- suffix_last = "<leader>sl", -- Suffix to search with "prev" method
				-- suffix_next = "<leader>sn", -- Suffix to search with "next" method
			},
		},
	},
}
