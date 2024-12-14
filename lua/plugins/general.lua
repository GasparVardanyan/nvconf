return {

	{
		"nvim-neorg/neorg",
		lazy = true,
		version = "*", -- Pin Neorg to the latest stable release
		config = true,
	},

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
	},

	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
		event = "User FilePost",
		opts = function()
			-- return require "nvchad.configs.gitsigns"
		end,
	},

	{
		"sindrets/diffview.nvim",
		lazy = true,
	},

	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			-- { "<leader>gl", "<cmd>LazyGit<cr>", desc = "LazyGit" }
		}
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
		"stevearc/conform.nvim",
		lazy = true,
		opts = {
			formatters_by_ft = { lua = { "stylua" } },
		},
	},

	{
		"williamboman/mason.nvim",
		lazy = true,
		-- cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
		opts = function()
			-- return require "nvchad.configs.mason"
		end,
	},

	{
		"neovim/nvim-lspconfig",
		lazy = true,
		event = "User FilePost",
		config = function()
			-- require("nvchad.configs.lspconfig").defaults()
		end,
	},

	{
		"folke/trouble.nvim",
		lazy = true,
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},

	{
		"RRethy/vim-illuminate",
		lazy = true,
	},

}
