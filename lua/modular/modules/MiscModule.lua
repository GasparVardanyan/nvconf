local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local MiscModule = Module:new ({
	name = "Misc",
	plugins = {
		require ("modular.specs.Misc.vim-table-mode"),
		require ("modular.specs.Misc.image_nvim"),
	},
	actions = {
		ModuleAction:new ({
			plugins = "vim-table-mode",
			event = ModuleAction.EventType.Pre,
			action = function ()
				vim.g.table_mode_disable_mappings = 1
				vim.g.table_mode_disable_tableize_mappings = 1
			end
		}),
		ModuleAction:new ({
			plugins = "mason.nvim",
			action = function ()
				require ("modular.mappings.Misc.mason_nvim")
			end
		}),
	}
})

return MiscModule
