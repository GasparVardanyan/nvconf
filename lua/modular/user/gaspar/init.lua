require ("modular.user.gaspar.config")

require ("modular.options")
require ("modular.lazy")
require ("modular.autocmds.generic")
require ("modular.mappings.generic")

require ("modular.user.gaspar.autocmds.hls_commands")
require ("modular.user.gaspar.autocmds.gcrypt")
require ("modular.user.gaspar.autocmds.xdefaults_highlight")

local ModuleManager = require ("modular.ModuleManager")

vim.api.nvim_create_autocmd ("User", {
	pattern = "ModuleReady",
	callback = function (data)
		if data.data == "UI"
		then
			vim.opt.background = "dark"
			vim.cmd.colorscheme "solarized-osaka"
		end
	end,
})

ModularManager = ModuleManager:new ({
	modules = require ("modular.user.gaspar.modules"),
	load_tracker = true
})
