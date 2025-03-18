local Module = require ("config.Module")
local PostPluginLoadAction = require ("config.PostPluginLoadAction")

local UIModule = Module:new ({
	name = "UI",
	priority = 1000,
	plugins = {
		require ("config.specs.UI.NeoSolarized_nvim"),
		require ("config.specs.UI.solarized-osaka_nvim"),
		require ("config.specs.UI.solarized_nvim"),
	},
	post_plugin_load_actions = {
		PostPluginLoadAction:new ({
			plugins = "NeoSolarized.nvim",
			action = function ()
				vim.cmd [[
					set background=light
					color NeoSolarized
				]]
			end
		})
	},
})

return UIModule
