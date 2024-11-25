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

}
