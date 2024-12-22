return {
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
--		keys = {
--			{
--				"<leader>xx",
--				"<cmd>Trouble diagnostics toggle<cr>",
--				desc = "Diagnostics (Trouble)",
--			},
--			{
--				"<leader>xX",
--				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
--				desc = "Buffer Diagnostics (Trouble)",
--			},
--			{
--				"<leader>cs",
--				"<cmd>Trouble symbols toggle focus=false<cr>",
--				desc = "Symbols (Trouble)",
--			},
--			{
--				"<leader>cl",
--				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
--				desc = "LSP Definitions / references / ... (Trouble)",
--			},
--			{
--				"<leader>xL",
--				"<cmd>Trouble loclist toggle<cr>",
--				desc = "Location List (Trouble)",
--			},
--			{
--				"<leader>xQ",
--				"<cmd>Trouble qflist toggle<cr>",
--				desc = "Quickfix List (Trouble)",
--			},
--		},
	},

	{
		"RRethy/vim-illuminate",
		lazy = true,
	},

	{
		"stevearc/conform.nvim",
		lazy = true,
		opts = {
			formatters_by_ft = { lua = { "stylua" } },
		},
	}
}
