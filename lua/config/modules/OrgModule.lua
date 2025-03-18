local Module = require ("config.Module")
local PostPluginLoadAction = require ("config.PostPluginLoadAction")

local OrgModule = Module:new ({
	name = "Org",
	plugins = {
		require ("config.specs.misc.image_nvim"),
		require ("config.specs.Org.neorg"),
		require ("config.specs.Org.orgmode"),
	},
	post_plugin_load_actions = {
		PostPluginLoadAction:new ({
			plugins = "neorg",
			action = function ()
				vim.api.nvim_create_autocmd ({"BufNewFile", "BufReadPost"}, {
					pattern = { "*.norg" },
					callback = function ()
						vim.cmd [[
							setlocal nonu nornu conceallevel=3 concealcursor=nv
						]]
					end
				})
			end
		})
	},
})

return OrgModule
