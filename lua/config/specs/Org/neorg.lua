return {
	"nvim-neorg/neorg",
	dependencies = {
		"image.nvim",
		"nvim-neorg/tree-sitter-norg",
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
				-- ["core.latex.renderer"] = {},
				["core.summary"] = {},
				["core.text-objects"] = {},
			},
		}
	end
}
