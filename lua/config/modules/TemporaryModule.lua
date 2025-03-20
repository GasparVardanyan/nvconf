local Module = require ("config.Module")
local PostPluginLoadAction = require ("config.PostPluginLoadAction")

-- TODO: refactor these specs and move to the appropriate location
local TemporaryModule = Module:new ({
	name = "Temporary",
	plugins = {
		{
			"williamboman/mason.nvim",
			config = true,
		},

		{
			"williamboman/mason-lspconfig.nvim",
			dependencies = { "williamboman/mason.nvim" },
			config = function()
				require ('mason-lspconfig').setup ({
					ensure_installed = { "lua_ls", "clangd" }
				})
			end,
		},

		{
			"neovim/nvim-lspconfig",
			dependencies = {
				"hrsh7th/nvim-cmp"
				-- 'saghen/blink.cmp'
			},
			event = "User FilePost",
			config = function()
				local lspconfig = require ("lspconfig")

				local capabilities = require('cmp_nvim_lsp').default_capabilities()
				-- local capabilities = require('blink.cmp').get_lsp_capabilities()
				lspconfig ['clangd'].setup {
					capabilities = capabilities
				}
				lspconfig ['lua_ls'].setup {
					capabilities = capabilities
				}
			end,
		},

		{
			"mfussenegger/nvim-lint",
			config = function()
				require('lint').linters_by_ft = {
					cpp = {'clangtidy', 'cppcheck'},
				}
			end,
		},

		{
			"folke/trouble.nvim",
			opts = {}, -- for default options, refer to the configuration section for custom setup.
			cmd = "Trouble",
			config = true,
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
		},

		{
			"hedyhli/outline.nvim",
			config = true,
		},

		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			lazy = false,
		},

		{
			"hrsh7th/nvim-cmp",
			dependencies = {
				'hrsh7th/cmp-nvim-lsp',
				'hrsh7th/cmp-buffer',
				'hrsh7th/cmp-path',
				'hrsh7th/cmp-cmdline',
				'L3MON4D3/LuaSnip',
				'saadparwaiz1/cmp_luasnip',
			},
			after = { "nvim-cmp" },

			config = function ()
				local cmp = require'cmp'

				cmp.setup({
					snippet = {
						expand = function(args)
							require('luasnip').lsp_expand(args.body)
						end,
					},
					window = {
						completion = cmp.config.window.bordered(),
						documentation = cmp.config.window.bordered(),
					},
					mapping = cmp.mapping.preset.insert({
						['<C-b>'] = cmp.mapping.scroll_docs(-4),
						['<C-f>'] = cmp.mapping.scroll_docs(4),
						['<C-Space>'] = cmp.mapping.complete(),
						['<C-e>'] = cmp.mapping.abort(),
						['<CR>'] = cmp.mapping.confirm({ select = true }),
					}),
					sources = cmp.config.sources({
						{ name = 'nvim_lsp' },
						{ name = 'luasnip' },
					}, {
							{ name = 'buffer' },
							{ name = "nvim_lua" },
							{ name = "path" },
						})
				})

				cmp.setup.cmdline({ '/', '?' }, {
					mapping = cmp.mapping.preset.cmdline(),
					sources = {
						{ name = 'buffer' }
					}
				})

				cmp.setup.cmdline(':', {
					mapping = cmp.mapping.preset.cmdline(),
					sources = cmp.config.sources({
						{ name = 'path' }
					}, {
							{ name = 'cmdline' }
						}),
					matching = { disallow_symbol_nonprefix_matching = false }
				})
			end,
		},
	},
	post_plugin_load_actions = {
		PostPluginLoadAction:new ({
			plugins = "outline.nvim",
			action = function ()
				require ("config.mappings.outline")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = { "nvim-lspconfig", "telescope.nvim" },
			action = function ()
				require ("config.mappings.Lsp.nvim_lspconfig_telescope_nvim")
			end
		}),
	}
})

return TemporaryModule
