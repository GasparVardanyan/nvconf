require ("modular.options")
require ("modular.lazy")
require ("modular.autocmds.generic")
require ("modular.mappings.generic")

require ("modular.extras")

-- local MasonLspServers = require ("modular.mason.lspservers")
-- MasonLspServers ["clangd"] = {}
--
-- local MasonTools = require ("modular.mason.tools")
-- vim.list_extend (MasonTools, {
-- 	"codelldb", "cpplint", "clang-format"
-- })

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
