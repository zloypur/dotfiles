local dap = require('dap')
local repl = require('dap.repl')
local vscode = require('dap.ext.vscode')

repl.commands = vim.tbl_extend('force', repl.commands, {
  scopes = { ".scopes", ".s" },
})

vim.keymap.set('n', '<F9>', dap.continue, {})
vim.keymap.set('n', '<F8>', dap.step_over, {})
vim.keymap.set('n', '<F7>', dap.step_into, {})
vim.keymap.set('n', '<F5>', dap.step_out, {})
vim.keymap.set('n', '<leader>dfr', dap.restart_frame, {})
vim.keymap.set('n', '<leader>dfu', dap.up, {})
vim.keymap.set('n', '<leader>dfd', dap.down, {})
vim.keymap.set('n', '<leader>dff', dap.focus_frame, {})
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, {})
vim.keymap.set('n', '<leader>dbl', dap.list_breakpoints, {})
vim.keymap.set('n', '<leader>dbc', dap.clear_breakpoints, {})
vim.keymap.set('n', '<leader>dr', repl.toggle, {})
vim.keymap.set('n', '<leader>dt', dap.terminate, {})
vim.keymap.set('n', '<leader>dll', vscode.load_launchjs, {})
