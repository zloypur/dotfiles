vim.g.mapleader       = " "

vim.opt.mouse         = "a"
vim.opt.errorbells    = false
vim.opt.termguicolors = true

-- allow backspacing over everything in insert mode
vim.opt.backspace     = "indent,eol,start"


-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Set tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true


vim.opt.wrap = false
vim.opt.smartcase = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.ruler = true

-- Clipboard
-- vim.o.clipboard+=unnamedplus
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
