return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	setup = function ()
		print ("HELLO")
		require ("mason-tool-installer").setup {
			ensure_installed = require ("modular.mason")
		}
	end
}
