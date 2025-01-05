return {
	{
		"williamboman/mason.nvim",
		lazy = true,
		config = true,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		lazy = true,
		config = true,
		opts = {
			ensure_installed = { "lua_ls", "clangd" }
		},
	},

	{
		"neovim/nvim-lspconfig",
		lazy = true,
		event = "User FilePost",
		config = function()
			local lspconfig = require ("lspconfig")
			lspconfig.lua_ls.setup ({})
			lspconfig.clangd.setup ({})
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
		config = true,
	},

	{
		"hedyhli/outline.nvim",
		lazy = true,
		config = true,
	},

	{
		"https://github.com/p00f/clangd_extensions.nvim",
		lazy = true
	}
}
