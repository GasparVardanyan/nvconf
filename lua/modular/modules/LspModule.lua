local Module = require ("modular.Module")
local PostPluginLoadAction = require ("modular.PostPluginLoadAction")

local LspModule = Module:new ({
	name = "Lsp",
	plugins = {
		require ("modular.specs.misc.mason_nvim"),
		require ("modular.specs.Lsp.nvim-lspconfig"),
		require ("modular.specs.Lsp.LuaSnip"),
		require ("modular.specs.Lsp.nvim-cmp"),
		require ("modular.specs.Lsp.nvim-autopairs"),
		require ("modular.specs.Lsp.indent-blankline_nvim"),
		require ("modular.specs.Lsp.outline_nvim"),
		require ("modular.specs.Lsp.vim-illuminate"),
		require ("modular.specs.Lsp.trouble_nvim"),
		-- require ("modular.specs.Lsp.nvim-treesitter-textobjects"),
		require ("modular.specs.Lsp.lspsaga_nvim"),
		-- require ("modular.modules.TemporaryModule2")
	},
	post_plugin_load_actions = {
		PostPluginLoadAction:new ({
			plugins = "nvim-lspconfig",
			action = function ()
				require ("modular.mappings.Lsp.lspconfig")
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
				require ("modular.mappings.Lsp.outline")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = "trouble.nvim",
			action = function ()
				require ("modular.mappings.Lsp.toruble_nvim")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = "lspsaga.nvim",
			action = function ()
				require ("modular.mappings.Lsp.lspsaga_nvim")
			end
		}),
	}
})

return LspModule
