return {
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "echasnovski/mini.icons" },
		config = function(opts)
			-- calling `setup` is optional for customization
			require("fzf-lua").setup({ "telescope" })
		end,

		keys = {
			-- Basic
			{
				"<leader>ff",
				function()
					require("fzf-lua").files()
				end,
			},
			{
				"<leader>fs",
				function()
					require("fzf-lua").live_grep()
				end,
			},
			{
				"<leader>b",
				function()
					require("fzf-lua").buffers()
				end,
			},
			{
				"<leader>fq",
				function()
					require("fzf-lua").quickfix()
				end,
			},
			-- LSP
			{
				"gr",
				function()
					require("fzf-lua").lsp_references({ jump1 = true })
				end,
			},
			{
				"<leader>ss",
				function()
					require("fzf-lua").lsp_live_workspace_symbols()
				end,
			},
			{
				"gd",
				function()
					require("fzf-lua").lsp_definitions({ jump1 = true })
				end,
			},
			{
				"gi",
				function()
					require("fzf-lua").lsp_implementations({ jump1 = true })
				end,
			},
		},
	},
}
