local Module = require ("modular.Module")
local PostPluginLoadAction = require ("modular.PostPluginLoadAction")

local AiModule = Module:new ({
	name = "Ai",
	priority = 1000,
	plugins = {
		require ("modular.specs.misc.img-clip_nvim"),
		require ("modular.specs.Ai.avante_nvim"),
		require ("modular.specs.Ai.mcphub_nvim"),
	},
	post_plugin_load_actions = {
	}
})

return AiModule
