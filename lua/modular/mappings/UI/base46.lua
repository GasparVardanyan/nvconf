local map = vim.keymap.set

map ("n", "<leader>mb", function ()
	require 'base46'.toggle_theme ()
end, { desc = "Base46 Switch Theme" })

map ("n", "<leader>mt", function ()
	require 'base46'.toggle_transparency ()
end, { desc = "Base46 Toggle Transparency" })
