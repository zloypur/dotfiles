local telescope = require('telescope')
local builtin = require('telescope.builtin')

vim.api.nvim_create_autocmd("FileType", {
	pattern = "TelescopeResults",
	callback = function(ctx)
		vim.api.nvim_buf_call(ctx.buf, function()
			vim.fn.matchadd("TelescopeParent", "\t\t.*$")
			vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
		end)
	end,
})

local function find_files_path_format(_, path)
	local tail = vim.fs.basename(path)
	local parent = vim.fs.dirname(path)
	if parent == "." then return tail end
	return string.format("%s\t\t%s", tail, parent)
end

telescope.setup {
    pickers = {
        find_files = {
            path_display = find_files_path_format,
        },
    },
    defaults = {
        layout_strategy = "vertical",
        layout_config = {
            vertical = {
                prompt_position = 'top',
                height = 0.95,
                width = 0.95,
                mirror = true,
                preview_height = 0.5,
                preview_cutoff = 0,
            }
        },
        path_display = {
            tail = {},
        },
        dynamic_preview_title = true, -- show full file path in preview title
    }
}



telescope.load_extension('undo')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fu', telescope.extensions.undo.undo, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fj', builtin.jumplist, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fG', builtin.git_status, {})
vim.keymap.set('n', '<leader>fht', builtin.help_tags, {})
