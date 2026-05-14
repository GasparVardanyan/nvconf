local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local DocModule = Module:new ({
	name = "Doc",
	plugins = {
		require ("modular.specs.Doc.zeavim_vim"),
	},
	actions = {
		ModuleAction:new ({
			plugins = "zeavim.vim",
			event = ModuleAction.EventType.Pre,
			action = function ()
				vim.g.zv_disable_mapping = 1
			end
		}),
	},
})

return DocModule
