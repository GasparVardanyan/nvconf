local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local MiscModule = Module:new ({
	name = "Misc",
	plugins = {
		require ("modular.specs.Misc.vim-table-mode")
	},
	actions = {
		ModuleAction:new ({
			plugins = "mason.nvim",
			action = function ()
					require ("modular.mappings.Misc.mason_nvim")
			end
		}),
	}
})

return MiscModule
