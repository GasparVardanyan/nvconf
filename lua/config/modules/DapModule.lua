local Module = require ("config.Module")
local PostPluginLoadAction = require ("config.PostPluginLoadAction")

local DapModule = Module:new ({
	name = "Dap",
	plugins = {
		require ("config.specs.misc.mason_nvim"),
		require ("config.specs.Dap.nvim-dap"),
		require ("config.specs.Dap.mason-nvim-dap"),
		require ("config.specs.Dap.nvim-dap-ui"),
	},
	post_plugin_load_actions = {
		PostPluginLoadAction:new ({
			plugins = "nvim-dap",
			action = function ()
				require ("config.mappings.Dap.nvim-dap")
			end
		})
	}
})

return DapModule
