return {
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "echasnovski/mini.icons" },
		config = function(opts)
			-- patterns must be lua compatible regex separated by :
			local file_ignore_patterns = vim.split(os.getenv("FZF_FILE_IGNORE_PATTERNS") or "", ":")

			require("fzf-lua").setup({
				"telescope",
				winopts = {
					border = "single",
				},
				files = {
					hidden = true,
					follow = true,
					no_ignore = true,
					file_ignore_patterns = file_ignore_patterns,
				},
				grep = {
					hidden = true,
					follow = true,
					no_ignore = true,
				},
			})
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
			{
				"<leader>fr",
				function()
					require("fzf-lua").resume()
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
				"<leader>fl",
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
