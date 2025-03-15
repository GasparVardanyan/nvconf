local Module = require ("config.Module")

local BasicModule = Module:new ({
	name = "Basic",
	plugins = {
		{
			"nvim-telescope/telescope.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"LukasPietzschmann/telescope-tabs",
				"nvim-telescope/telescope-ui-select.nvim",
				"debugloop/telescope-undo.nvim",
			},
			config = function()
				require("telescope-tabs").setup ()
				require("telescope").setup ({
					extensions = {
						["ui-select"] = {
							require("telescope.themes").get_dropdown {
								-- even more opts
							}
						},
						["tabs"] = {},
						["undo"] = {},
					}
				})
				require("telescope").load_extension("telescope-tabs")
				require("telescope").load_extension("ui-select")
				require("telescope").load_extension("undo")
			end,
		},

		{
			"MagicDuck/grug-far.nvim",
			config = function()
				require("grug-far").setup({
					engine = "ripgrep"
				});
			end
		},

		{
			"majutsushi/tagbar",
		},

		{
			"mbbill/undotree",

			config = function()
				vim.cmd [[
					let g:undotree_WindowLayout=2
					let g:undotree_DiffpanelHeight=8
					" let g:undotree_DiffCommand = "delta"

					if has("persistent_undo")
						let target_path = expand('~/.undodir')

						" create the directory and any parent directories
						" if the location does not exist.
						if !isdirectory(target_path)
							call mkdir(target_path, "p", 0700)
						endif

						let &undodir=target_path
						set undofile
					endif
				]]
			end,
		},

		{ -- TODO: check nvchad/lazyvim setup
			"nvim-treesitter/nvim-treesitter",
			event = { "BufReadPost", "BufNewFile" },
			-- cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
			build = ":TSUpdate",
			opts = {
				ensure_installed = { "lua", "luadoc", "printf", "vim", "vimdoc", "norg", },
				highlight = {
					enable = true,
					use_languagetree = true,
				},
				indent = { enable = true },
			},
			config = function(_, opts)
				require("nvim-treesitter.configs").setup(opts)
			end,
		},
	}
})

return BasicModule
