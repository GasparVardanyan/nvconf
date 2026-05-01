local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local ProfilerModule = Module:new ({
	name = "Profiler",
	plugins = {
		require ("modular.specs.Profiler.perfanno_nvim")
	},
	actions = {
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = "perfanno.nvim",
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>p",  "profiler")
				reg_mapping_group ("<leader>pl",  "load")
			end
		}),
		ModuleAction:new ({
			plugins = "perfanno.nvim",
			action = function ()
				require ("modular.mappings.Profiler.perfanno_nvim")
			end
		}),
	}
})

return ProfilerModule
