require ("modular.options")
require ("modular.lazy")
require ("modular.autocmds.generic")
require ("modular.mappings.generic")

require ("modular.extras")

local ModuleManager = require ("modular.ModuleManager")

ModularManager = ModuleManager:new ({
	modules = require ("modular.modules"),
	load_tracker = false
})

-- vim.api.nvim_create_autocmd ("User", {
-- 	pattern = "ModuleReady",
-- 	callback = function (data)
-- 		print (data.data .. " - Module Loaded\n")
-- 	end,
-- })
