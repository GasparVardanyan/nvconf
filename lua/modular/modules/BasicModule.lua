local Module = require ("modular.Module")
local PostPluginLoadAction = require ("modular.PostPluginLoadAction")

local BasicModule = Module:new ({
	name = "Basic",
	plugins = {
		require ("modular.specs.Basic.cd-project_nvim"),
		require ("modular.specs.Basic.Comment_nvim"),
		-- require ("modular.specs.Basic.dashboard-nvim"),
		require ("modular.specs.Basic.dropbar_nvim"),
		require ("modular.specs.Basic.grug-far_nvim"),
		require ("modular.specs.Basic.neo-tree_nvim"),
		require ("modular.specs.Basic.nvim-treesitter"),
		require ("modular.specs.Basic.oil_nvim"),
		require ("modular.specs.Basic.tagbar"),
		require ("modular.specs.Basic.telescope_nvim"),
		require ("modular.specs.Basic.todo-comments_nvim"),
		require ("modular.specs.Basic.toggleterm_nvim"),
		require ("modular.specs.Basic.ts-comments_nvim"),
		require ("modular.specs.Basic.undotree"),
		require ("modular.specs.misc.nvim-window-picker"),
		require ("modular.specs.misc.image_nvim"),
	},
	post_plugin_load_actions = {
		PostPluginLoadAction:new ({
			plugins = "dropbar.nvim",
			action = function ()
				require ("modular.mappings.Basic.dropbar_nvim")
			end
		}),
		-- PostPluginLoadAction:new ({
		-- 	plugins = "cd-project.nvim",
		-- 	action = function ()
		-- 		require ("modular.autocmds.Basic.cd-project_nvim_VimEnter")
		-- 	end
		-- }),
		PostPluginLoadAction:new ({
			plugins = "cd-project.nvim",
			action = function ()
				require ("modular.mappings.Basic.cd-project_nvim")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = "grug-far.nvim",
			action = function ()
				require ("modular.mappings.Basic.grug-far_nvim")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = "neo-tree.nvim",
			action = function ()
				require ("modular.mappings.Basic.neo-tree_nvim")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = { "neo-tree.nvim", "vim-illuminate" },
			action = function ()
				require ("modular.autocmds.Basic.neo-tree_noilluminate")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = { "oil.nvim" },
			action = function ()
				require ("modular.mappings.Basic.oil_nvim")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = "tagbar",
			action = function ()
				require ("modular.mappings.Basic.tagbar")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = "telescope.nvim",
			action = function ()
				require ("modular.mappings.Basic.telescope_nvim")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = { "telescope.nvim", "todo-comments.nvim" },
			action = function ()
				require ("modular.mappings.Basic.todo-comments_nvim-telescope_nvim")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = "toggleterm.nvim",
			action = function ()
				require ("modular.mappings.Basic.toggleterm_nvim")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = "undotree",
			action = function ()
				require ("modular.mappings.Basic.undotree")
			end
		})
	}
})

return BasicModule
