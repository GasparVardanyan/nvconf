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
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = "avante.nvim",
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>a",  "avante")
			end
		}),
	}
})

return AiModule
