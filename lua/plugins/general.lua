return {

	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"nvim-tree/nvim-tree.lua",
		lazy = true,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
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
		lazy = false,
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
		"RRethy/vim-illuminate",
		lazy = true,
	},
}
