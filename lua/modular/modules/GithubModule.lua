local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local GithubModule = Module:new ({
	name = "Github",
	plugins = {
		require ("modular.specs.Github.octo_nvim"),
	},
	actions = {
		ModuleAction:new ({
			plugins = "octo.nvim",
			action = function ()
				require ("modular.mappings.Github.octo_nvim")
			end
		}),
	}
})

return GithubModule
