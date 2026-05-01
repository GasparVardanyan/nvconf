local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local OrgModule = Module:new ({
	name = "Org",
	plugins = {
		-- require ("modular.specs.Org.neorg"),
		require ("modular.specs.Org.orgmode"),
		-- require ("modular.specs.Misc.image_nvim"),
		-- require ("modular.specs.Misc.headlines_nvim"),
	},
	actions = {
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = "orgmode",
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>o",  "org")
			end
		}),
		ModuleAction:new ({
			plugins = "neorg",
			action = function ()
				require ("modular.autocmds.Org.neorg")
			end
		}),
		ModuleAction:new ({
			plugins = { "neorg", "vim-illuminate" },
			action = function ()
				require ("modular.autocmds.Org.neorg_noilluminate")
			end
		})
	}
})

return OrgModule
