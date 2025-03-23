local Module = require ("config.Module")
local PostPluginLoadAction = require ("config.PostPluginLoadAction")

local LspModule = Module:new ({
	name = "Lsp",
	plugins = {
		require ("config.specs.Lsp.lspsaga_nvim")
		-- require ("config.specs.Lsp.nvim-cmp")
	},
	post_plugin_load_actions = {
		PostPluginLoadAction:new ({
			plugins = "lspsaga.nvim",
			action = function ()
				require ("config.mappings.Lsp.lspsaga_nvim")
			end
		}),
	}
})

return LspModule
