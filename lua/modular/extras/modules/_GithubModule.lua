local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local GithubModule = Module:new ({
	name = "Github",
	plugins = {
		-- https://github.com/pwntester/octo.nvim
	},
	actions = {
	}
})

return GithubModule
