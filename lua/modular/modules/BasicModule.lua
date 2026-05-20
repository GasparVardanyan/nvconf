local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local BasicModule = Module:new ({
	name = "Basic",
	plugins = {
		require ("modular.specs.Basic.Comment_nvim"),
		require ("modular.specs.Basic.arrow_nvim"),
		require ("modular.specs.Basic.cd-project_nvim"),
		require ("modular.specs.Basic.diffs_nvim"),
		require ("modular.specs.Basic.fzf-lua"),
		require ("modular.specs.Basic.grug-far_nvim"),
		require ("modular.specs.Basic.neo-tree_nvim"),
		require ("modular.specs.Basic.neogen"),
		require ("modular.specs.Basic.nvim-bqf"),
		require ("modular.specs.Basic.nvim-colorizer_lua"),
		require ("modular.specs.Basic.nvim-fundo"),
		require ("modular.specs.Basic.nvim-treesitter-context"),
		require ("modular.specs.Basic.nvim-treesitter-textobjects"),
		require ("modular.specs.Basic.nvim-ufo"),
		require ("modular.specs.Basic.oil_nvim"),
		require ("modular.specs.Basic.tagbar"),
		require ("modular.specs.Basic.telescope_nvim"),
		require ("modular.specs.Basic.todo-comments_nvim"),
		require ("modular.specs.Basic.toggleterm_nvim"),
		require ("modular.specs.Basic.tree-sitter-manager_nvim"),
		require ("modular.specs.Basic.treesj"),
		require ("modular.specs.Basic.ts-comments_nvim"),
		require ("modular.specs.Basic.undotree"),
		require ("modular.specs.Basic.which-key_nvim"),
		require ("modular.specs.Misc.nvim-window-picker"),
		-- require ("modular.specs.Basic.dashboard-nvim"),
		-- require ("modular.specs.Basic.nvim-treesitter"),
		-- require ("modular.specs.Misc.image_nvim"),
		-- require ("modular.specs.Basic.edgy_nvim"),
		{
			"LunarVim/bigfile.nvim",
			config = true,
		},
	},
	actions = {
		-- ModuleAction:new ({
		-- 	plugins = "cd-project.nvim",
		-- 	action = function ()
		-- 		require ("modular.autocmds.Basic.cd-project_nvim_VimEnter")
		-- 	end
		-- }),
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = "cd-project.nvim",
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>P",  "project")
			end
		}),
		ModuleAction:new ({
			plugins = "cd-project.nvim",
			action = function ()
				require ("modular.mappings.Basic.cd-project_nvim")
			end
		}),
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = "grug-far.nvim",
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>s", "grug")
			end
		}),
		ModuleAction:new ({
			plugins = "grug-far.nvim",
			action = function ()
				require ("modular.mappings.Basic.grug-far_nvim")
			end
		}),
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = "neo-tree.nvim",
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>e", "neotree")
			end
		}),
		ModuleAction:new ({
			plugins = "neo-tree.nvim",
			action = function ()
				require ("modular.mappings.Basic.neo-tree_nvim")
			end
		}),
		ModuleAction:new ({
			plugins = "nvim-treesitter-context",
			action = function ()
				require ("modular.mappings.Basic.nvim-treesitter-context")
				require ("treesitter-context").enable ()
			end
		}),
		ModuleAction:new ({
			plugins = "treesj",
			action = function ()
				require ("modular.mappings.Basic.treesj")
			end
		}),
		ModuleAction:new ({
			plugins = "nvim-ufo",
			action = function ()
				require ("modular.mappings.Basic.nvim-ufo")
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
			event = ModuleAction.EventType.Pre,
			plugins = "telescope.nvim",
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group

				reg_mapping_group ("<leader>f", "fuzzy")
				reg_mapping_group ("<leader>fu", "undo")
			end
		}),
		ModuleAction:new ({
			plugins = "telescope.nvim",
			action = function ()
				require ("modular.mappings.Basic.telescope_nvim")
			end
		}),
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = "fzf-lua",
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group

				reg_mapping_group ("<leader>f", "fuzzy")
				reg_mapping_group ("<leader>fD", "diagnostics")
			end
		}),
		-- NOTE: load fzf-lua mappings after telescope ones to override
		ModuleAction:new ({
			plugins = "fzf-lua",
			action = function ()
				require ("modular.mappings.Basic.fzf-lua")
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
			event = ModuleAction.EventType.Pre,
			plugins = "undotree",
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>u", "undotree")
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
		}),
		ModuleAction:new ({
			plugins = "edgy.nvim",
			event = ModuleAction.EventType.Pre,
			action = function ()
				-- views can only be fully collapsed with the global statusline
				vim.opt.laststatus = 3
				-- Default splitting will cause your main splits to jump when opening an edgebar.
				-- To prevent this, set `splitkeep` to either `screen` or `topline`.
				vim.opt.splitkeep = "screen"
			end
		}),
	}
})

return BasicModule
