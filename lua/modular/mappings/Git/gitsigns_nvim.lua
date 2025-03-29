local map = vim.keymap.set

local gs = package.loaded.gitsigns
map ("n", "[h", gs.prev_hunk, { desc = "Previous Hunk" })
map ("n", "]h", gs.next_hunk, { desc = "Next Hunk"})
map ("n", "<leader>gd", gs.preview_hunk, { desc = "Diff Hunk"})
map ("n", "<leader>gu", gs.reset_hunk, { desc = "Undo Hunk"})
map("n", "<leader>gD", function() gs.diffthis "@" end,
	{ desc = "git [D]iff against last commit" })
