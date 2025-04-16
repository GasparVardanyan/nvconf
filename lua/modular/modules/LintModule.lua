local Module = require ("modular.Module")
local PostPluginLoadAction = require ("modular.PostPluginLoadAction")

local LintModule = Module:new ({
	name = "Lint",
	plugins = {
		require ("modular.specs.Lint.nvim-lint")
	},
	post_plugin_load_actions = {
		PostPluginLoadAction:new ({
			plugins = "nvim-lint",
			action = function ()
				require ("modular.autocmds.Lint.nvim-lint")
			end
		}),
	}
})

return LintModule
