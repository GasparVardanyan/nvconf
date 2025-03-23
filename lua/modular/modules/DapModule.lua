local Module = require ("modular.Module")
local PostPluginLoadAction = require ("modular.PostPluginLoadAction")

local DapModule = Module:new ({
	name = "Dap",
	plugins = {
		require ("modular.specs.misc.mason_nvim"),
		require ("modular.specs.Dap.nvim-dap"),
		require ("modular.specs.Dap.mason-nvim-dap"),
		require ("modular.specs.Dap.nvim-dap-ui"),
	},
	post_plugin_load_actions = {
		PostPluginLoadAction:new ({
			plugins = "nvim-dap",
			action = function ()
				require ("modular.mappings.Dap.nvim-dap")
			end
		})
	}
})

return DapModule
