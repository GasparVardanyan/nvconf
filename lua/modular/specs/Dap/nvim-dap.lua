return {
	"mfussenegger/nvim-dap",
	config = function ()
		local dap = require ("dap")
		dap.configurations = vim.tbl_deep_extend ("error", dap.configurations, require ("modular.config.dapconfigs"))
		dap.adapters = vim.tbl_deep_extend ("error", dap.adapters, require ("modular.config.dapadapters"))
	end,
}
