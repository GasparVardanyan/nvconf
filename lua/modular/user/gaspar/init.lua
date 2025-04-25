require ("modular.user.gaspar.autocmds.hls_commands")
require ("modular.user.gaspar.autocmds.gcrypt")
require ("modular.user.gaspar.autocmds.xdefaults_highlight")

local MasonLspServers = require ("modular.mason.lspservers")
MasonLspServers ["clangd"] = {}

local MasonTools = require ("modular.mason.tools")
vim.list_extend (MasonTools, {
	"codelldb", "cpplint", "clang-format"
})

require ("modular")
