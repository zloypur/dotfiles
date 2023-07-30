local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.load_extension('undo')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("grep > ") })
end)
vim.keymap.set('n', '<leader>fu', telescope.extensions.undo.undo, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fj', builtin.jumplist, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fht', builtin.help_tags, {})
