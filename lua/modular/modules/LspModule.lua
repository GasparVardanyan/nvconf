local Module = require ("modular.Module")
local PostPluginLoadAction = require ("modular.PostPluginLoadAction")

local LspModule = Module:new ({
	name = "Lsp",
	plugins = {
		require ("modular.specs.misc.mason_nvim"),
		require ("modular.specs.Lsp.nvim-lspconfig"),
		require ("modular.specs.Lsp.fidget_nvim"),
		-- require ("modular.specs.Lsp.LuaSnip"),
		-- require ("modular.specs.Lsp.nvim-cmp"),
		require ("modular.specs.Lsp.nvim-autopairs"),
		require ("modular.specs.Lsp.indent-blankline_nvim"),
		require ("modular.specs.Lsp.outline_nvim"),
		require ("modular.specs.Lsp.vim-illuminate"), -- TODO: move to extras and add a module for the native way
		require ("modular.specs.Lsp.trouble_nvim"),
		require ("modular.specs.Lsp.goto-preview"),
		require ("modular.specs.Lsp.dropbar_nvim"),
		-- require ("modular.specs.Lsp.nvim-treesitter-textobjects"),
		-- require ("modular.specs.Lsp.lspsaga_nvim"), -- NOTE: this thing replaces dropbar, idk ho to disable it ((
	},
	post_plugin_load_actions = {
		PostPluginLoadAction:new ({
			plugins = "nvim-lspconfig",
			action = function ()
				require ("modular.mappings.Lsp.nvim-lspconfig")
				require ("modular.autocmds.Lsp.nvim-lspconfig")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = { "nvim-lspconfig", "telescope.nvim" },
			action = function ()
				require ("modular.mappings.Lsp.nvim-lspconfig_telescope_nvim")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = "outline.nvim",
			action = function ()
				require ("modular.mappings.Lsp.outline_nvim")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = "trouble.nvim",
			action = function ()
				require ("modular.mappings.Lsp.trouble_nvim")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = "goto-preview",
			action = function ()
				require ("modular.mappings.Lsp.goto-preview")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = "dropbar.nvim",
			action = function ()
				require ("modular.mappings.Lsp.dropbar_nvim")
			end
		}),
	}
})

return LspModule
