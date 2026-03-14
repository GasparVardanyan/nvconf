local map = vim.keymap.set
local FzfLua = require ("fzf-lua")

map ("n", "<leader>fG", FzfLua.git_status, { desc = "git status" })
map ("n", "<leader>fW", FzfLua.git_worktrees, { desc = "git worktrees" })

map ("n", "<leader>gw", FzfLua.git_worktrees, { desc = "git worktrees" })
map ("n", "<leader>gs", FzfLua.git_status, { desc = "git status" })
