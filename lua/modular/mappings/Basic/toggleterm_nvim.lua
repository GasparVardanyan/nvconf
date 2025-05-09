local map = vim.keymap.set

map ({ "n", "t", "i", }, "<c-/>", function () vim.cmd.ToggleTerm { 'name=Modular_Float', 'direction=float',  } end, { desc = "ToggleTerm" })
