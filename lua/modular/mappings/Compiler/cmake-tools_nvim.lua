local map = vim.keymap.set

map ("n", "<leader>cor", vim.cmd.CMakeOpenRunner, { desc = "runner" })
map ("n", "<leader>coe", vim.cmd.CMakeOpenExecutor, { desc = "executor" })
map ("n", "<leader>coc", vim.cmd.CMakeOpenCache, { desc = "cache" })

map ("n", "<leader>ccR", vim.cmd.CMakeCloseRunner, { desc = "runner" })
map ("n", "<leader>ccE", vim.cmd.CMakeCloseExecutor, { desc = "executor" })
map ("n", "<leader>csR", vim.cmd.CMakeStopRunner, { desc = "runner" })
map ("n", "<leader>csE", vim.cmd.CMakeStopExecutor, { desc = "executor" })

map ("n", "<leader>ccr", function ()
	vim.cmd.CMakeStopRunner ()
	vim.cmd.CMakeCloseRunner ()
end, { desc = "runner stop and close" })
map ("n", "<leader>cce", function ()
	vim.cmd.CMakeStopExecutor ()
	vim.cmd.CMakeCloseExecutor ()
end, { desc = "executor stop and close" })

map ("n", "<leader>csr", function ()
	vim.cmd.CMakeStopRunner ()
	vim.cmd.CMakeCloseRunner ()
end, { desc = "runner stop and close" })
map ("n", "<leader>cse", function ()
	vim.cmd.CMakeStopExecutor ()
	vim.cmd.CMakeCloseExecutor ()
end, { desc = "executor stop and close" })

map ("n", "<leader>cg", function ()
	vim.cmd.CMakeGenerate ()
	vim.cmd [[
		" if filereadable("out/compile_commands.json")
		" 	call system ("sleep 2; sed -i 's/-mno-direct-extern-access//g' 'out/compile_commands.json'")
		" endif
	]]
end, { desc = "cmake generate" })

map ("n", "<leader>cb", function ()
	vim.cmd.CMakeCloseExecutor ()
	vim.cmd.CMakeBuild ()
end , { desc = "cmake build" })
map ("n", "<leader>cr", function ()
	vim.cmd.CMakeCloseExecutor ()
	vim.cmd.CMakeCloseRunner ()
	vim.cmd.CMakeRun ()
end , { desc = "cmake run" })
map ("n", "<leader>cd", vim.cmd.CMakeDebug, { desc = "cmake debug" })
map ("n", "<leader>cC", vim.cmd.CMakeClean, { desc = "cmake clean" })
