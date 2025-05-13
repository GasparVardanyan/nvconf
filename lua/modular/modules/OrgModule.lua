local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local OrgModule = Module:new ({
	name = "Org",
	plugins = {
		require ("modular.specs.Org.neorg"),
		require ("modular.specs.Org.orgmode"),
		-- require ("modular.specs.Misc.image_nvim"),
		require ("modular.specs.Misc.headlines_nvim"),
	},
	post_plugin_load_actions = {
		ModuleAction:new ({
			plugins = "neorg",
			action = function ()
				require ("modular.autocmds.Org.neorg")
				require ("modular.mappings.Org.neorg")
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
