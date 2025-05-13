local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local GdbModule = Module:new ({
	name = "Gdb",
	plugins = {
		require ("modular.extras.specs.Gdb.nvim-gdb"),
	},
	actions = {
		ModuleAction:new ({
			plugins = "nvim-gdb",
			event = ModuleAction.EventType.Pre,
			action = function ()
				vim.g.nvimgdb_disable_start_keymaps = 1
			end
		}),
	},
})

return GdbModule
