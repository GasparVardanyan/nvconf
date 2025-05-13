local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local LintModule = Module:new ({
	name = "Lint",
	plugins = {
		require ("modular.specs.Lint.nvim-lint")
	},
	actions = {
		ModuleAction:new ({
			plugins = "nvim-lint",
			action = function ()
				require ("modular.autocmds.Lint.nvim-lint")
			end
		}),
	}
})

return LintModule
