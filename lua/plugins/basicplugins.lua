return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		dependencies = { "nvim-lua/plenary.nvim", "LukasPietzschmann/telescope-tabs" },
		config = function()
			require('telescope-tabs').setup ()
			require('telescope').load_extension 'telescope-tabs'
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		lazy = true,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			require ("nvim-tree").setup ()
		end
	},

	{
		"nvim-pack/nvim-spectre",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"folke/trouble.nvim"
		},
	},

	{
		"majutsushi/tagbar",
		lazy = true,
	},

    {
        "mbbill/undotree",
        lazy = true,

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

	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		-- cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "lua", "luadoc", "printf", "vim", "vimdoc" },

			highlight = {
				enable = true,
				use_languagetree = true,
			},

			indent = { enable = true },
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	}
}
