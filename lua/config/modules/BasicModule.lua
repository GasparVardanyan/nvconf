local Module = require ("config.Module")
local PostPluginLoadAction = require ("config.PostPluginLoadAction")

local BasicModule = Module:new ({
	name = "Basic",
	plugins = {
		require ("config.specs.Basic.Comment_nvim"),
		require ("config.specs.Basic.dashboard-nvim"),
		require ("config.specs.Basic.dropbar_nvim"),
		require ("config.specs.Basic.grug-far_nvim"),
		require ("config.specs.Basic.neo-tree_nvim"),
		require ("config.specs.Basic.nvim-treesitter"),
		require ("config.specs.Basic.oil_nvim"),
		require ("config.specs.Basic.tagbar"),
		require ("config.specs.Basic.telescope_nvim"),
		require ("config.specs.Basic.todo-comments_nvim"),
		require ("config.specs.Basic.toggleterm_nvim"),
		require ("config.specs.Basic.ts-comments_nvim"),
		require ("config.specs.Basic.undotree"),
	},
	post_plugin_load_actions = {
		PostPluginLoadAction:new ({
			plugins = "dropbar.nvim",
			action = function ()
				require ("config.mappings.Basic.dropbar_nvim")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = "grug-far.nvim",
			action = function ()
				require ("config.mappings.Basic.grug-far_nvim")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = "neo-tree.nvim",
			action = function ()
				require ("config.mappings.Basic.neo-tree_nvim")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = { "neo-tree.nvim", "vim-illuminate" },
			action = function ()
				require ("config.autocmds.Basic.neo-tree_noilluminate")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = "tagbar",
			action = function ()
				require ("config.mappings.Basic.tagbar")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = "telescope.nvim",
			action = function ()
				require ("config.mappings.Basic.telescope_nvim")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = { "telescope.nvim", "todo-comments.nvim" },
			action = function ()
				require ("config.mappings.Basic.todo-comments_nvim-telescope_nvim")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = "toggleterm.nvim",
			action = function ()
				require ("config.mappings.Basic.toggleterm_nvim")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = "undotree",
			action = function ()
				require ("config.mappings.Basic.undotree")
			end
		})
	}
})

return BasicModule
