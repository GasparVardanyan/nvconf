return {
	"nvim-neorg/neorg",
	lazy = true,
	dependencies = {
		"image.nvim",
		"tree-sitter-norg",
		"nvim-orgmode/org-bullets.nvim",
		"lukas-reineke/headlines.nvim",
	},
	version = "*", -- Pin Neorg to the latest stable release
	config = true,
}
