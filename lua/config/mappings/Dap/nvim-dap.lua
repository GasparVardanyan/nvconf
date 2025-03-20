local map = vim.keymap.set

map('n', '<leader>db', vim.cmd.DapToggleBreakpoint)
map('n', '<leader>dc', vim.cmd.DapContinue)
map('n', '<leader>dd', vim.cmd.DapDisconnect)
map('n', '<leader>dp', vim.cmd.DapPause)
map('n', '<leader>dt', vim.cmd.DapTerminate)
map('n', '<leader>dt', vim.cmd.DapVirtualTextToggle)
