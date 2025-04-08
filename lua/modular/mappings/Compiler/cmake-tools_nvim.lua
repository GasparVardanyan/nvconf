local map = vim.keymap.set

map ("n", "<leader>cC", vim.cmd.CMakeClean, { desc = "cmake clean" })
map ("n", "<leader>cO", vim.cmd.CMakeOpenRunner, { desc = "cmake open" })
map ("n", "<leader>cb", vim.cmd.CMakeBuild, { desc = "cmake build" })
map ("n", "<leader>cc", vim.cmd.CMakeCloseRunner, { desc = "cmake close" })
map ("n", "<leader>cd", vim.cmd.CMakeDebug, { desc = "cmake debug" })
map ("n", "<leader>cg", vim.cmd.CMakeGenerate, { desc = "cmake generate" })
map ("n", "<leader>cr", vim.cmd.CMakeRun, { desc = "cmake run" })
