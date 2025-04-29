local LspServers = require ("modular.config.lspservers")
LspServers ["clangd"] = {}
LspServers ["neocmake"] = {}

local MasonTools = require ("modular.config.masontools")
vim.list_extend (MasonTools, {
	"codelldb", "cpplint", "clang-format"
})

local AvanteOpts = require ("modular.config.avanteopts")
AvanteOpts.provider = "gemini"
AvanteOpts.aihubmix = {
	model = "DeepSeek-V3",
}
AvanteOpts.gemini = {
	model = "gemini-2.5-flash-preview-04-17",
}

require ("modular.options")
require ("modular.lazy")
require ("modular.autocmds.generic")
require ("modular.mappings.generic")

require ("modular.extras")

require ("modular.user.gaspar.autocmds.hls_commands")
require ("modular.user.gaspar.autocmds.gcrypt")
require ("modular.user.gaspar.autocmds.xdefaults_highlight")

local ModuleManager = require ("modular.ModuleManager")

local modules = vim.tbl_extend (
	"error",
	require ("modular.modules"),
	require ("modular.user.gaspar.modules")
)

ModularManager = ModuleManager:new ({
	modules = modules,
	load_tracker = false
})
