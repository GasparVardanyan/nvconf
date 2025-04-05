local map = vim.keymap.set

map ("n", "<leader>tS", function () vim.cmd.Neotest "stop" end)
map ("n", "<leader>ta", function () vim.cmd.Neotest "attach" end)
map ("n", "<leader>tc", function () vim.cmd.ConfigureGtest () end)
map ("n", "<leader>tj", function () vim.cmd.Neotest "jump" end)
map ("n", "<leader>to", function () vim.cmd.Neotest "output" end)
map ("n", "<leader>tp", function () vim.cmd.Neotest "output-panel" end)
map ("n", "<leader>tr", function () vim.cmd.Neotest "run" end)
map ("n", "<leader>ts", function () vim.cmd.Neotest "summary" end)
