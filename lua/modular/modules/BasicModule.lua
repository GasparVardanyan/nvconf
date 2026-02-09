local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local BasicModule = Module:new ({
	name = "Basic",
	plugins = {
		require ("modular.specs.Basic.arrow_nvim"),
		require ("modular.specs.Basic.cd-project_nvim"),
		require ("modular.specs.Basic.Comment_nvim"),
		-- require ("modular.specs.Basic.dashboard-nvim"),
		require ("modular.specs.Basic.grug-far_nvim"),
		-- require ("modular.specs.Basic.neo-tree_nvim"),
		require ("modular.specs.Basic.nvim-treesitter"),
		require ("modular.specs.Basic.oil_nvim"),
		require ("modular.specs.Basic.tagbar"),
		require ("modular.specs.Basic.telescope_nvim"),
		require ("modular.specs.Basic.fzf_lua"),
		require ("modular.specs.Basic.todo-comments_nvim"),
		require ("modular.specs.Basic.toggleterm_nvim"),
		require ("modular.specs.Basic.ts-comments_nvim"),
		require ("modular.specs.Basic.undotree"),
		require ("modular.specs.Misc.nvim-window-picker"),
		-- require ("modular.specs.Misc.image_nvim"),
		require ("modular.specs.Basic.which-key_nvim"),
	},
	actions = {
		-- ModuleAction:new ({
		-- 	plugins = "cd-project.nvim",
		-- 	action = function ()
		-- 		require ("modular.autocmds.Basic.cd-project_nvim_VimEnter")
		-- 	end
		-- }),
		ModuleAction:new ({
			plugins = "cd-project.nvim",
			action = function ()
				require ("modular.mappings.Basic.cd-project_nvim")
			end
		}),
		ModuleAction:new ({
			plugins = "grug-far.nvim",
			action = function ()
				require ("modular.mappings.Basic.grug-far_nvim")
			end
		}),
		ModuleAction:new ({
			plugins = "neo-tree.nvim",
			action = function ()
				require ("modular.mappings.Basic.neo-tree_nvim")
			end
		}),
		ModuleAction:new ({
			plugins = { "neo-tree.nvim", "vim-illuminate" },
			action = function ()
				require ("modular.autocmds.Basic.neo-tree_noilluminate")
			end
		}),
		ModuleAction:new ({
			plugins = { "oil.nvim" },
			action = function ()
				require ("modular.mappings.Basic.oil_nvim")
			end
		}),
		ModuleAction:new ({
			plugins = "telescope.nvim",
			action = function ()
				require ("modular.mappings.Basic.telescope_nvim")
			end
		}),
		-- NOTE: load fzf-lua mappings after telescope ones to override
		ModuleAction:new ({
			plugins = "fzf-lua",
			action = function ()
				require ("modular.mappings.Basic.fzf_lua")
			end
		}),
		ModuleAction:new ({
			plugins = { "telescope.nvim", "todo-comments.nvim" },
			action = function ()
				require ("modular.mappings.Basic.todo-comments_nvim-telescope_nvim")
			end
		}),
		ModuleAction:new ({
			plugins = "toggleterm.nvim",
			action = function ()
				require ("modular.mappings.Basic.toggleterm_nvim")
			end
		}),
		ModuleAction:new ({
			plugins = "undotree",
			action = function ()
				require ("modular.mappings.Basic.undotree")
			end
		}),
		ModuleAction:new ({
			plugins = "which-key.nvim",
			action = function ()
				require ("modular.autocmds.Basic.which-key_nvim")
			end
		})
	}
})

return BasicModule
