local Module = require ("modular.Module")
local PostPluginLoadAction = require ("modular.PostPluginLoadAction")

local DbModule = Module:new ({
	name = "Db",
	plugins = {
		require ("modular.specs.Db.vim-dadbod"),
		require ("modular.specs.Db.vim-dadbod-completion"),
		require ("modular.specs.Db.vim-dadbod-ui"),
	},
	post_plugin_load_actions = {
		PostPluginLoadAction:new ({
			plugins = "vim-dadbod-ui",
			action = function ()
				require ("modular.mappings.Db.vim-dadbod-ui")
			end
		}),
	}
})

return DbModule
