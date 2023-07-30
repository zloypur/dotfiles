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
--vim.keymap.set("n", "j", "<Down>")
--vim.keymap.set("n", "k", "<Up>")
--vim.keymap.set("n", "l", "<Right>")
--vim.keymap.set("n", "h", "<Left>")

-- Copy to clipboard
-- For Mac OS replace 'xsel -b' with 'pbcopy' and 'xsel -o -b' with 'pbpaste'
-- Alternative clipboard for Linux replace 'xclip -i -sel c' with 'pbcopy' and 'xclip -o -sel -c' with 'pbpaste'
if vim.fn.has('macunix') then
    vim.keymap.set("v", "<leader>y", ":w !pbcopy<CR><CR>")
    vim.keymap.set("v", "<leader>Y", ":%w !pbcopy<CR><CR>")
    vim.keymap.set("v", "<leader>Y", ":%w !pbcopy<CR><CR>")
    vim.keymap.set("v", "<leader>p", ":!pbpaste<CR><CR>")
    vim.keymap.set("n", "<leader>p", ":r!pbpaste<CR><CR>")
elseif vim.fn.has('win32') then
    vim.keymap.set("v", "<leader>y", ":w !clip<CR><CR>")
    vim.keymap.set("v", "<leader>Y", ":%w !clip<CR><CR>")
    vim.keymap.set("v", "<leader>Y", ":%w !clip<CR><CR>")
elseif vim.fn.has('unix') then
    vim.keymap.set("v", "<leader>y", ":w !xsel -b<CR><CR>")
    vim.keymap.set("v", "<leader>Y", ":%w !xsel -b<CR><CR>")
    vim.keymap.set("v", "<leader>Y", ":%w !xsel -b<CR><CR>")
    vim.keymap.set("v", "<leader>p", ":!xsel -o -b<CR><CR>")
    vim.keymap.set("n", "<leader>p", ":r!xsel -o -b<CR><CR>")
end
