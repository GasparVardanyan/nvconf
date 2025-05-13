local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local DbModule = Module:new ({
	name = "Db",
	plugins = {
		require ("modular.specs.Db.vim-dadbod"),
		require ("modular.specs.Db.vim-dadbod-completion"),
		require ("modular.specs.Db.vim-dadbod-ui"),
	},
	actions = {
		ModuleAction:new ({
			plugins = "vim-dadbod-ui",
			action = function ()
				require ("modular.mappings.Db.vim-dadbod-ui")
			end
		}),
	}
})

return DbModule
