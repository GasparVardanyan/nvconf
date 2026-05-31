require ("modular.user.gaspar.config")

require ("modular.options")
require ("modular.lazy")
require ("modular.autocmds.generic")
require ("modular.mappings.generic")

require ("modular.user.gaspar.autocmds.hls_commands")
require ("modular.user.gaspar.autocmds.gcrypt")
require ("modular.user.gaspar.autocmds.xdefaults_highlight")
require ("modular.user.gaspar.autocmds.transparency")

local ModuleManager = require ("modular.ModuleManager")

vim.api.nvim_create_autocmd ("User", {
	pattern = "ModuleReady",
	callback = function (data)
		if data.data == "UI"
		then
			-- sometimes the theme doesn't get loaded, this seems to help:
			-- require ("nvconfig").base46.theme = require ("chadrc").base46.theme
			-- require ("base46").load_all_highlights ()
			-- do return end
			-- vim.opt.background = "dark"
			-- vim.cmd.colorscheme "solarized-osaka"
			-- vim.cmd.colorscheme "base16-solarized-dark"
			-- vim.cmd.colorscheme "neosolarized"
			-- vim.cmd.colorscheme "NV_solarized_dark"
			-- vim.opt.background = "light"
			-- vim.cmd.colorscheme "NV_solarized_light"
			-- vim.cmd ':TT'
			vim.o.background = "dark"
			vim.cmd.colorscheme "NV_solarized_dark"
		end
	end,
})

ModularManager = ModuleManager:new ({
	modules = require ("modular.user.gaspar.modules"),
	load_tracker = true
})
