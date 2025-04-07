local Module = require ("modular.Module")
local PostPluginLoadAction = require ("modular.PostPluginLoadAction")

local LspSagaModule = Module:new ({
	name = "LspSaga",
	plugins = {
		require ("modular.extras.specs.LspSaga.lspsaga_nvim"),
	},
	post_plugin_load_actions = {
		PostPluginLoadAction:new ({
			plugins = "lspsaga.nvim",
			action = function ()
				require ("modular.extras.mappings.LspSaga.lspsaga_nvim")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = { "lspsaga.nvim", "which-key.nvim" },
			action = function ()
				require ("modular.extras.autocmds.LspSaga.lspsaga_nvim-whichkey")
			end
		}),
	}
})

return LspSagaModule
