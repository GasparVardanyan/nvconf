local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local RestModule = Module:new ({
	name = "Rest",
	plugins = {
		-- require ("modular.specs.Rest.rest_nvim"),
		require ("modular.specs.Rest.kulala_nvim"),
	},
	actions = {
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			action = function ()
				local TreeSitters = require ("modular.config.treesitters")

				vim.list_extend (TreeSitters, { "http" })
			end
		}),
	}
})

return RestModule
