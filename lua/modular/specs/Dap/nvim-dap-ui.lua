return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		"nvim-treesitter/nvim-treesitter",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")

		dapui.setup ()
		require("nvim-dap-virtual-text").setup ()

		-- dap.listeners.before.attach.dapui_config = dapui.open
		-- dap.listeners.before.launch.dapui_config = dapui.open
		dap.listeners.after.event_initialized.dapui_config = dapui.open

		dap.listeners.before.event_terminated.dapui_config = dapui.close
		dap.listeners.before.event_exited.dapui_config = dapui.close
	end
}
