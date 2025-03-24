local Module = require ("modular.Module")
local PostPluginLoadAction = require ("modular.PostPluginLoadAction")

local DapModule = Module:new ({
	name = "Dap",
	plugins = {
		require ("modular.specs.misc.mason_nvim"),
		require ("modular.specs.Dap.nvim-dap"),
		require ("modular.specs.Dap.mason-nvim-dap"),
		require ("modular.specs.Dap.nvim-dap-ui"),
		require ("modular.specs.Dap.telescope-dap_nvim"),
	},
	post_plugin_load_actions = {
		PostPluginLoadAction:new ({
			plugins = "nvim-dap",
			action = function ()
				require ("modular.mappings.Dap.nvim-dap")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = { "telescope-dap.nvim", "telescope.nvim" },
			action = function ()
				require ("modular.mappings.Dap.telescope-dap_telescope_nvim")
			end
		})
	}
})

return DapModule
