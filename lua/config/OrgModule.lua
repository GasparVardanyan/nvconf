local Module = require ("config.Module")

--vim.api.nvim_create_autocmd ({"BufNewFile", "BufReadPost"}, {
--	pattern = {
--		"*.norg"
--		, "*.org"
--	},
--	callback = function ()
--		vim.cmd [[setlocal nonu nornu conceallevel=3 concealcursor=nv]]
--		vim.cmd [[IlluminateToggleBuf]]
--	end,
--})
--vim.api.nvim_create_autocmd ({"BufWritePre"}, {
--	pattern = {
--		"*.norg"
--		, "*.org"
--	},
--	callback = function ()
--		vim.cmd [[norm gg=G]]
--	end,
--})

local OrgModule = Module:new ("Org", {
	{
		"3rd/image.nvim",
		config = true,
	},

	{
		"nvim-neorg/neorg",
		dependencies = {
			"image.nvim",
			"tree-sitter-norg",
			"nvim-orgmode/org-bullets.nvim",
			"lukas-reineke/headlines.nvim",
			"nvim-lua/plenary.nvim",
		},
		version = "*", -- Pin Neorg to the latest stable release

		config = function()
			require("neorg").setup {
				load = {
--					["core.completion"] = {
--						config = {
--							engine = "nvim-cmp",
--						},
--					},
					["core.concealer"] = {
						config = {
							icon_preset = "basic",
							icons = {
								code_block = {
									conceal = true
								}
							}
						},
					},
					["core.defaults"] = {},
					["core.dirman"] = {
						config = {
							workspaces = {
								notes = "~/.notes",
								todos = "~/.todos",
							},
							default_workspace = "notes",
						},
					},
					["core.export"] = {},
					["core.latex.renderer"] = {},
					["core.summary"] = {},
					["core.text-objects"] = {},
				},
			}
		end
	},

	{
		"nvim-orgmode/orgmode",
		dependencies = {
			"nvim-orgmode/org-bullets.nvim",
			"lukas-reineke/headlines.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		event = "VeryLazy",
		ft = { "org" },
		config = function()
			require("orgmode").setup({
				org_agenda_files = "~/orgfiles/**/*",
				org_default_notes_file = "~/orgfiles/refile.org",
			})
		end,
	},
})

return OrgModule
