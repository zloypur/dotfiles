-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup {
  view = {
    adaptive_size = true,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
}
local api = require("nvim-tree.api")


-- custom mappings
vim.keymap.set('n', '<leader>nn', api.tree.toggle)
vim.keymap.set('n', '<leader>nf', api.tree.focus)
vim.keymap.set('n', '<leader>nc', function()
  api.tree.find_file { open = true, focus = true }
end)
