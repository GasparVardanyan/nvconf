-- require ("oldconfig")
-- do return end

require ("modular.options")
require ("modular.lazy")
require ("modular.autocmds.generic")
require ("modular.mappings.generic")

require ("modular.extras.autocmds.hls_commands")

local ModuleManager = require ("modular.ModuleManager")

---@diagnostic disable-next-line: unused-local
local mm = ModuleManager:new ({
	modules = require ("modular.modules"),
	load_tracker = true
})

vim.api.nvim_create_autocmd ("User", {
	pattern = "ModuleReady",
	callback = function (data)
		print (data.data .. " - Module Loaded\n")
	end,
})
