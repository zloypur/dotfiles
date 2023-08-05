vim.g.mapleader = " "

-- Multiwindows
vim.keymap.set("n", "<leader>vs", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>hs", vim.cmd.split)

-- Multiwindows navigation using hjkl
vim.keymap.set("n", "<A-j>", "<C-W>j")
vim.keymap.set("n", "<A-k>", "<C-W>k")
vim.keymap.set("n", "<A-l>", "<C-W>l")
vim.keymap.set("n", "<A-h>", "<C-W>h")

-- Multiwindows navigation using hjkl
vim.keymap.set("i", "<A-j>", "<Down>")
vim.keymap.set("i", "<A-k>", "<Up>")
vim.keymap.set("i", "<A-l>", "<Right>")
vim.keymap.set("i", "<A-h>", "<Left>")

-- Multiwindows resize
local horizontal_resize_step = 5
local vertical_resize_step = 12
vim.keymap.set("n", "<A-_>", "<Cmd>resize -" .. horizontal_resize_step .. "<CR>")
vim.keymap.set("n", "<A-+>", "<Cmd>resize +" .. horizontal_resize_step .. "<CR>")
vim.keymap.set("n", "<A-->", "<Cmd>vertical resize -" .. vertical_resize_step .. "<CR>")
vim.keymap.set("n", "<A-=>", "<Cmd>vertical resize +" .. vertical_resize_step .. "<CR>")

