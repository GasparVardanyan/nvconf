local Module = require ("modular.Module")
local PostPluginLoadAction = require ("modular.PostPluginLoadAction")

-- TODO: refactor these specs and move to the appropriate location
local TemporaryModule1 = Module:new ({
	name = "Temporary1",
	plugins = {
		-- {
		-- 	"williamboman/mason-lspconfig.nvim",
		-- 	dependencies = { "williamboman/mason.nvim" },
		-- 	config = function()
		-- 		require ('mason-lspconfig').setup ({
		-- 			ensure_installed = { "lua_ls", "clangd" }
		-- 		})
		-- 	end,
		-- },

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
				lspconfig ['leanls'].setup {
					capabilities = capabilities
				}
			end,
		},

		require ("modular.specs.misc.mason_nvim"),
		-- require ("modular.specs.Lsp.nvim-lspconfig"),
		-- require ("modular.specs.Lsp.LuaSnip"),
		-- require ("modular.specs.Lsp.nvim-cmp"),
		require ("modular.specs.Lsp.nvim-autopairs"),
		require ("modular.specs.Lsp.indent-blankline_nvim"),
		require ("modular.specs.Lsp.outline_nvim"),
		require ("modular.specs.Lsp.vim-illuminate"),
		require ("modular.specs.Lsp.trouble_nvim"),
		require ("modular.specs.Lsp.goto-preview"),

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
						}, {
							name = "lazydev",
							group_index = 0, -- set group index to 0 to skip loading LuaLS completions
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
		{ 'j-hui/fidget.nvim', opts = {} },
	},
	post_plugin_load_actions = {
		PostPluginLoadAction:new ({
			plugins = "nvim-lspconfig",
			action = function ()
				require ("modular.mappings.Lsp.nvim-lspconfig")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = { "nvim-lspconfig", "telescope.nvim" },
			action = function ()
				require ("modular.mappings.Lsp.nvim-lspconfig_telescope_nvim")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = "outline.nvim",
			action = function ()
				require ("modular.mappings.Lsp.outline_nvim")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = "trouble.nvim",
			action = function ()
				require ("modular.mappings.Lsp.trouble_nvim")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = "goto-preview",
			action = function ()
				require ("modular.mappings.Lsp.goto-preview")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = "lspsaga.nvim",
			action = function ()
				require ("modular.mappings.Lsp.lspsaga_nvim")
			end
		}),
	}
})

return TemporaryModule1
