local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local ProfilerModule = Module:new ({
	name = "Profiler",
	plugins = {
		require ("modular.specs.Profiler.perfanno_nvim")
	},
	actions = {
		ModuleAction:new ({
			plugins = "perfanno.nvim",
			action = function ()
				require ("modular.mappings.Profiler.perfanno_nvim")
			end
		}),
	}
})

return ProfilerModule
