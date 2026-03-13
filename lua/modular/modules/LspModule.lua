local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local LspModule = Module:new ({
	name = "Lsp",
	plugins = {
		require ("modular.specs.Misc.mason_nvim"),
		require ("modular.specs.Lsp.nvim-lspconfig"),
		require ("modular.specs.Lsp.mason-lspconfig"),
		require ("modular.specs.Lsp.mason-tool-installer"),
		require ("modular.specs.Lsp.fidget_nvim"),
		require ("modular.specs.Lsp.nvim-autopairs"),
		require ("modular.specs.Lsp.indent-blankline_nvim"),
		require ("modular.specs.Lsp.outline_nvim"),
		require ("modular.specs.Lsp.vim-illuminate"), -- TODO: move to extras and add a module for the native way
		require ("modular.specs.Lsp.trouble_nvim"),
		require ("modular.specs.Lsp.goto-preview"),
		require ("modular.specs.Lsp.dropbar_nvim"),
		require ("modular.specs.Lsp.nvim-lsp-file-operations"),
		-- require ("modular.specs.Lsp.blink_cmp"),
		-- require ("modular.specs.Lsp.lspsaga_nvim"),
	},
	actions = {
		ModuleAction:new ({
			plugins = "nvim-lspconfig",
			action = function ()
				require ("modular.mappings.Lsp.nvim-lspconfig")
				require ("modular.autocmds.Lsp.nvim-lspconfig")
			end
		}),
		ModuleAction:new ({
			plugins = { "nvim-lspconfig", "telescope.nvim" },
			action = function ()
				require ("modular.mappings.Lsp.nvim-lspconfig_telescope_nvim")
			end
		}),
		-- NOTE: load fzf-lua mappings after telescope ones to override
		ModuleAction:new ({
			plugins = { "nvim-lspconfig", "fzf-lua" },
			action = function ()
				require ("modular.mappings.Lsp.nvim-lspconfig_fzf-lua")
			end
		}),
		ModuleAction:new ({
			plugins = "outline.nvim",
			action = function ()
				require ("modular.mappings.Lsp.outline_nvim")
			end
		}),
		ModuleAction:new ({
			plugins = "trouble.nvim",
			action = function ()
				require ("modular.mappings.Lsp.trouble_nvim")
			end
		}),
		ModuleAction:new ({
			plugins = "goto-preview",
			action = function ()
				require ("modular.mappings.Lsp.goto-preview")
			end
		}),
		ModuleAction:new ({
			plugins = "dropbar.nvim",
			action = function ()
				require ("modular.mappings.Lsp.dropbar_nvim")
			end
		}),
	}
})

return LspModule
