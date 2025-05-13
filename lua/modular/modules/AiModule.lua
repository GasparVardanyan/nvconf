local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local AiModule = Module:new ({
	name = "Ai",
	plugins = {
		require ("modular.specs.Misc.img-clip_nvim"),
		require ("modular.specs.Ai.avante_nvim"),
		-- require ("modular.specs.Ai.mcphub_nvim"),
		-- require ("modular.specs.Ai.VectorCode"),
	},
	actions = {
	}
})

return AiModule
