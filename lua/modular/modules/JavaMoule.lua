
local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local JavaModule = Module:new ({
	name = "Java",
	plugins = {
		-- {
		-- 	"mfussenegger/nvim-jdtls",
		-- },
		{
			"nvim-java/nvim-java",
			config = true,
		},
	},
	actions = {
		ModuleAction:new ({
			plugins = "nvim-java",
			action = function ()
				local map = vim.keymap.set

				map ("n", "<leader>jR", vim.cmd.JavaSettingsChangeRuntime, { desc = "change runtime" })
				map ("n", "<leader>jb", vim.cmd.JavaBuildBuildWorkspace, { desc = "build workspace" })
				map ("n", "<leader>jc", vim.cmd.JavaBuildCleanWorkspace, { desc = "clean workspace" })
				map ("n", "<leader>jd", vim.cmd.JavaDapConfig, { desc = "dap config" })
				map ("n", "<leader>jeV", vim.cmd.JavaRefactorExtractVariableAllOccurrence, { desc = "variable all occurence" })
				map ("n", "<leader>jec", vim.cmd.JavaRefactorExtractConstant, { desc = "constant" })
				map ("n", "<leader>jef", vim.cmd.JavaRefactorExtractField, { desc = "field" })
				map ("n", "<leader>jem", vim.cmd.JavaRefactorExtractMethod, { desc = "method" })
				map ("n", "<leader>jev", vim.cmd.JavaRefactorExtractVariable, { desc = "variable" })
				map ("n", "<leader>jls", vim.cmd.JavaRunnerSwitchLogs, { desc = "switch logs" })
				map ("n", "<leader>jlt", vim.cmd.JavaRunnerToggleLogs, { desc = "toggle logs" })
				map ("n", "<leader>jp", vim.cmd.JavaProfile, { desc = "profile" })
				map ("n", "<leader>jr", vim.cmd.JavaRunnerRunMain, { desc = "run main" })
				map ("n", "<leader>js", vim.cmd.JavaRunnerStopMain, { desc = "stop main" })
				map ("n", "<leader>jtD", vim.cmd.JavaTestDebugAllTests, { desc = "debug all tests" })
				map ("n", "<leader>jtdc", vim.cmd.JavaTestDebugCurrentClass, { desc = "current class" })
				map ("n", "<leader>jtdm", vim.cmd.JavaTestDebugCurrentMethod, { desc = "current method" })
				map ("n", "<leader>jtR", vim.cmd.JavaTestRunAllTests, { desc = "run all tests" })
				map ("n", "<leader>jtrc", vim.cmd.JavaTestRunCurrentClass, { desc = "current class" })
				map ("n", "<leader>jtrm", vim.cmd.JavaTestRunCurrentMethod, { desc = "current method" })
				map ("n", "<leader>jtv", vim.cmd.JavaTestViewLastReport, { desc = "view last report" })
			end
		}),
	}
})

return JavaModule
