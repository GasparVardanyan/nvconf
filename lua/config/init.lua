if nil then
	require ("oldconfig")
else
	require ("config.options")
	require ("config.lazy")
	require ("config.autocmds.generic")
	require ("config.mappings.generic")

	local ModuleManager = require ("config.ModuleManager")
---@diagnostic disable-next-line: unused-local
	local mm = ModuleManager:new ()

	vim.api.nvim_create_autocmd ("User", {
		pattern = "ModuleReady",
		callback = function (data)
			print (data.data .. " - Module Loaded\n")
		end,
	})
end
