local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local QtModule = Module:new ({
	name = "Qt",
	actions = {
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = "none-ls.nvim",
			action = function ()
				local NoneLSAdapters = require ("modular.config.nonels_adapters")
				vim.list_extend (NoneLSAdapters, {
					function ()
						return require ("null-ls").builtins.diagnostics.clazy
					end
				})
			end
		})
	}
})

return QtModule
