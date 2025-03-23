local Module = require ("modular.Module")
local PostPluginLoadAction = require ("modular.PostPluginLoadAction")

local LspModule = Module:new ({
	name = "Lsp",
	plugins = {
		require ("modular.specs.Lsp.lspsaga_nvim")
		-- require ("modular.specs.Lsp.nvim-cmp")
	},
	post_plugin_load_actions = {
		PostPluginLoadAction:new ({
			plugins = "lspsaga.nvim",
			action = function ()
				require ("modular.mappings.Lsp.lspsaga_nvim")
			end
		}),
	}
})

return LspModule
