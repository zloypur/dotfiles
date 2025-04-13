-- leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- navigation
vim.opt.mouse         = "a"
vim.opt.backspace     = "indent,eol,start" -- allow backspacing over everything in insert mode

-- terminal setup
vim.g.have_nerd_font = false
vim.opt.errorbells    = false
vim.opt.termguicolors = true

-- timings
vim.opt.timeoutlen = 300 -- map sequence completion timeout

-- line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- signs column
vim.opt.signcolumn = 'number'

-- ruler
vim.opt.ruler = true
vim.opt.colorcolumn = '90'
vim.opt.cursorline = true

-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.breakindent = true -- wrapped line will have the same indent as original line.

-- scrolloff
vim.opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor.

-- search and replace
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = 'split' -- enables live substitutions

-- show spaces
vim.opt.list = false -- should be turn on on demand
vim.opt.listchars = { tab = '> ', space = '·', nbsp = '+' }

-- undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- clipboard
vim.opt.clipboard = 'unnamedplus'

-- enable local configs
vim.o.exrc = true

