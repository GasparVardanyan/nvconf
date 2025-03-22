local Module = require ("config.Module")
local PostPluginLoadAction = require ("config.PostPluginLoadAction")

local LspModule = Module:new ({
	name = "Lsp",
	ft = "cpp",
	plugins = {
		{
			'nvimdev/lspsaga.nvim',
			config = function()
				require('lspsaga').setup({
					lightbulb = {
						sign = false
					}
				})
			end,
			dependencies = {
				'nvim-treesitter/nvim-treesitter', -- optional
				'nvim-tree/nvim-web-devicons',     -- optional
			}
		}
	},
	post_plugin_load_actions = {
		PostPluginLoadAction:new ({
			plugins = "lspsaga.nvim",
			action = function ()
				require ("config.mappings.Lsp.lspsaga_nvim")
			end
		}),
	}
})

return LspModule
