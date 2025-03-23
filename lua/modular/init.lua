if nil then
	require ("oldconfig")
else
	require ("modular.options")
	require ("modular.lazy")
	require ("modular.autocmds.generic")
	require ("modular.mappings.generic")

	local ModuleManager = require ("modular.ModuleManager")
---@diagnostic disable-next-line: unused-local
	local mm = ModuleManager:new ()

	vim.api.nvim_create_autocmd ("User", {
		pattern = "ModuleReady",
		callback = function (data)
			print (data.data .. " - Module Loaded\n")
		end,
	})
end
