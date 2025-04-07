local gs = package.loaded.gitsigns
local map = vim.keymap.set

map ("n", "[h", gs.prev_hunk, { desc = "prev_hunk" })
map ("n", "]h", gs.next_hunk, { desc = "next_hunk"})
map ("n", "<leader>gd", gs.preview_hunk, { desc = "diff Hunk"})
map ("n", "<leader>gu", gs.reset_hunk, { desc = "undo Hunk"})
map("n", "<leader>gD", function() gs.diffthis "@" end, { desc = "diff against last commit" })
