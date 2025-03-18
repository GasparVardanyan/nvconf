local Module = require ("config.Module")
local PostPluginLoadAction = require ("config.PostPluginLoadAction")

local OrgModule = Module:new ({
	name = "Org",
	plugins = {
		require ("config.specs.Org.neorg"),
		require ("config.specs.Org.orgmode"),
		require ("config.specs.misc.image_nvim"),
	},
	post_plugin_load_actions = {
		PostPluginLoadAction:new ({
			plugins = "neorg",
			action = function ()
				require ("config.autocmds.Org.neorg")
			end
		})
	},
})

return OrgModule
