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
				["core.defaults"] = {},
				["core.concealer"] = {
					config = {
						icons = {
							code_block = {
								conceal = true
							}
						}
					},
				},
				["core.dirman"] = {
					config = {
						workspaces = {
							notes = "~/.notes",
						},
					},
				},
				["core.latex.renderer"] = {},
				["core.export"] = {},
				["core.completion"] = {
					config = {
						engine = "nvim-cmp",
					},
				},
			},
		}
	end
}
