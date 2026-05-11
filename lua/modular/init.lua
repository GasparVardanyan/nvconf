require ("modular.options")
require ("modular.lazy")
require ("modular.autocmds.generic")
require ("modular.mappings.generic")

-- require ("modular")

-- local LspServers = require ("modular.config.lspservers")
-- LspServers ["clangd"] = {}
--
-- local MasonTools = require ("modular.config.masontools")
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
