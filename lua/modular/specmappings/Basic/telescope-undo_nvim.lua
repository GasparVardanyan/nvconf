return {
	i = {
		["<cr>"] = require("telescope-undo.actions").restore,
		["<C-a>"] = require("telescope-undo.actions").yank_additions,
		["<C-d>"] = require("telescope-undo.actions").yank_deletions,
	},
}
