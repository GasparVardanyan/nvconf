require ("modular.user.gaspar.config")

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
