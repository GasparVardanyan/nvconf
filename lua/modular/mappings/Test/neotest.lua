local map = vim.keymap.set

map ("n", "<leader>tS", function () vim.cmd.Neotest "stop" end, { desc = "neotest stop" })
map ("n", "<leader>ta", function () vim.cmd.Neotest "attach" end, { desc = "neotest attach" })
map ("n", "<leader>tc", function () vim.cmd.ConfigureGtest () end, { desc = "neotest configure gtest" })
map ("n", "<leader>tn", function () vim.cmd.Neotest "jump next" end, { desc = "neotest jump next" })
map ("n", "<leader>tp", function () vim.cmd.Neotest "jump prev" end, { desc = "neotest jump prev" })
map ("n", "<leader>to", function () vim.cmd.Neotest "output" end, { desc = "neotest output" })
map ("n", "<leader>tP", function () vim.cmd.Neotest "output-panel" end, { desc = "neotest output panel" })
map ("n", "<leader>tr", function () vim.cmd.Neotest "run" end, { desc = "neotest run" })
map ("n", "<leader>ts", function () vim.cmd.Neotest "summary" end, { desc = "neotest summary" })
