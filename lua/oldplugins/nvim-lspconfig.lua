return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/nvim-cmp"
		-- 'saghen/blink.cmp'
	},
	lazy = true,
	event = "User FilePost",
	config = function()
		local lspconfig = require ("lspconfig")

		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		-- local capabilities = require('blink.cmp').get_lsp_capabilities()
		require('lspconfig')['clangd'].setup {
			capabilities = capabilities
		}
		require('lspconfig')['lua_ls'].setup {
			capabilities = capabilities
		}
	end,
}
