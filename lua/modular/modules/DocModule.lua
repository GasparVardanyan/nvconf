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
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>z",  "zeal")
			end
		}),
		ModuleAction:new ({
			plugins = "zeavim.vim",
			event = ModuleAction.EventType.Pre,
			action = function ()
				require ("modular.mappings.Doc.zeavim_vim")
			end
		}),
	},
})

return DocModule
