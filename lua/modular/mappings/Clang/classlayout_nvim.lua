local map = vim.keymap.set

map ("n", "<leader>Cl", function () require ("classlayout").show () end, { desc = "class layout" })
