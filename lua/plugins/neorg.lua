return {
	"nvim-neorg/neorg",
	lazy = true,
	dependencies = {
		"image.nvim",
		"tree-sitter-norg",
		"nvim-orgmode/org-bullets.nvim",
		"lukas-reineke/headlines.nvim",
		"nvim-lua/plenary.nvim",
	},
	version = "*", -- Pin Neorg to the latest stable release

	config = function()
		vim.opt.conceallevel = 2
		require("neorg").setup {
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.concealer"] = {
					config = {
						icons = {
							code_block = {
								conceal = true
							}
						}
					},
				}, -- Adds pretty icons to your documents
				["core.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							notes = "~/.notes",
						},
					},
				},
			},
		}
	end
}
