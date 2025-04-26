require ("modular.user.gaspar.autocmds.hls_commands")
require ("modular.user.gaspar.autocmds.gcrypt")
require ("modular.user.gaspar.autocmds.xdefaults_highlight")

local LspServers = require ("modular.config.lspservers")
LspServers ["clangd"] = {}

local MasonTools = require ("modular.config.masontools")
vim.list_extend (MasonTools, {
	"codelldb", "cpplint", "clang-format"
})

local AvanteOpts = require ("modular.config.avateopts")
AvanteOpts.provider = "gemini"
AvanteOpts.aihubmix = {
	model = "DeepSeek-V3",
}
AvanteOpts.gemini = {
	model = "gemini-2.5-flash-preview-04-17",
}

require ("modular")
