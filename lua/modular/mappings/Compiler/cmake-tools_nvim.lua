local map = vim.keymap.set

map ("n", "<leader>cor", vim.cmd.CMakeOpenRunner, { desc = "cmake open runner" })
map ("n", "<leader>coe", vim.cmd.CMakeOpenExecutor, { desc = "cmake open executor" })
map ("n", "<leader>coc", vim.cmd.CMakeOpenCache, { desc = "cmake open cache" })
map ("n", "<leader>ccr", vim.cmd.CMakeCloseRunner, { desc = "cmake close runner" })
map ("n", "<leader>cce", vim.cmd.CMakeCloseExecutor, { desc = "cmake close executor" })
map ("n", "<leader>csr", vim.cmd.CMakeStopRunner, { desc = "cmake stop runner" })
map ("n", "<leader>cse", vim.cmd.CMakeStopExecutor, { desc = "cmake stop executor" })

map ("n", "<leader>cg", vim.cmd.CMakeGenerate, { desc = "cmake generate" })
map ("n", "<leader>cb", vim.cmd.CMakeBuild, { desc = "cmake build" })
map ("n", "<leader>cr", vim.cmd.CMakeRun, { desc = "cmake run" })
map ("n", "<leader>cd", vim.cmd.CMakeDebug, { desc = "cmake debug" })
map ("n", "<leader>cc", vim.cmd.CMakeClean, { desc = "cmake clean" })
