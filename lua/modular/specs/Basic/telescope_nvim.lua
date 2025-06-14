return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"LukasPietzschmann/telescope-tabs",
		"nvim-telescope/telescope-ui-select.nvim",
		"debugloop/telescope-undo.nvim",
		"Marskey/telescope-sg",
	},
	config = function()
		require("telescope-tabs").setup ()
		require("telescope").setup ({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown {
						-- even more opts
					}
				},
				["tabs"] = {},
				["undo"] = {},
				["ast_grep"] = {
					command = {
						"ast-grep",
						"--json=stream",
					}, -- must have --json=stream
					grep_open_files = false, -- search in opened files
					lang = nil, -- string value, specify language for ast-grep `nil` for default
				}
			}
		})
		require("telescope").load_extension("telescope-tabs")
		require("telescope").load_extension("ui-select")
		require("telescope").load_extension("undo")
	end,
}
