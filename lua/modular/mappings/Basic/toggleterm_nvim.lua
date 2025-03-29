local map = vim.keymap.set

map ({ "n", "t", "i", }, "<c-/>", "<cmd>ToggleTerm direction=float<cr>")
