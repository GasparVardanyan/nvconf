local map = vim.keymap.set

map ("n", "<leader>tS", function () vim.cmd.Neotest "stop" end, { desc = "stop" })
map ("n", "<leader>ta", function () vim.cmd.Neotest "attach" end, { desc = "attach" })
map ("n", "<leader>tc", function () vim.cmd.ConfigureGtest () end, { desc = "configure gtest" })
map ("n", "<leader>tn", function () vim.cmd.Neotest "jump next" end, { desc = "jump next" })
map ("n", "<leader>tp", function () vim.cmd.Neotest "jump prev" end, { desc = "jump prev" })
map ("n", "<leader>to", function () vim.cmd.Neotest "output" end, { desc = "output" })
map ("n", "<leader>tP", function () vim.cmd.Neotest "output-panel" end, { desc = "output panel" })
map ("n", "<leader>tr", function () vim.cmd.Neotest "run" end, { desc = "run" })
map ("n", "<leader>ts", function () vim.cmd.Neotest "summary" end, { desc = "summary" })
