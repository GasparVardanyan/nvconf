local map = vim.keymap.set
local FzfLua = require ("fzf-lua")

map ("n", "<leader>dfc", FzfLua.dap_commands, { desc = "commands" })
map ("n", "<leader>dfC", FzfLua.dap_configurations, { desc = "configurations" })
-- map ("n", "<leader>dfb", FzfLua.dap_list_breakpoints, { desc = "list breakpoints" })
map ("n", "<leader>dfb", FzfLua.dap_breakpoints, { desc = "list breakpoints" })
map ("n", "<leader>dfv", FzfLua.dap_variables, { desc = "variables" })
map ("n", "<leader>dff", FzfLua.dap_frames, { desc = "frames" })
