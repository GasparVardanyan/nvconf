local map = vim.keymap.set

map ("n", "<leader>cr", vim.cmd.CMakeRun, { desc = "cmake run" })
map ("n", "<leader>cd", vim.cmd.CMakeDebug, { desc = "cmake debug" })
map ("n", "<leader>cb", vim.cmd.CMakeBuild, { desc = "cmake build" })
map ("n", "<leader>cg", vim.cmd.CMakeGenerate, { desc = "cmake generate" })
map ("n", "<leader>cc", vim.cmd.CMakeClean, { desc = "cmake clean" })
