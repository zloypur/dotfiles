-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local tree = require("nvim-tree")
local api = require("nvim-tree.api")

local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.8

tree.setup {
  view = {
    adaptive_size = true,
    float = { -- this setup is taken from here https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#center-a-floating-nvim-tree-window
      enable = true,
      open_win_config = function()
        local screen_w = vim.opt.columns:get()
        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        local window_w = screen_w * WIDTH_RATIO
        local window_h = screen_h * HEIGHT_RATIO
        local window_w_int = math.floor(window_w)
        local window_h_int = math.floor(window_h)
        local center_x = (screen_w - window_w) / 2
        local center_y = ((vim.opt.lines:get() - window_h) / 2)
                         - vim.opt.cmdheight:get()
        return {
          border = 'rounded',
          relative = 'editor',
          row = center_y,
          col = center_x,
          width = window_w_int,
          height = window_h_int,
        }
        end,
    },
    width = function()
      return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
    end,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
    git_ignored = false,
  },
}

-- custom mappings
vim.keymap.set('n', '<leader>nn', api.tree.toggle, {})
vim.keymap.set('n', '<leader>nf', api.tree.focus, {})
vim.keymap.set('n', '<leader>nc', function()
  api.tree.find_file { open = true, focus = true }
end, {})
vim.keymap.set('n', '<leader>nh', api.tree.toggle_hidden_filter, {})
vim.keymap.set('n', '<leader>ni', api.tree.toggle_gitignore_filter, {})
