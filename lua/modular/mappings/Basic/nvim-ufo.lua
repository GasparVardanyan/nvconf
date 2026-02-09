local map = vim.keymap.set

map ("n", "zR", require("ufo").openAllFolds)
map ("n", "zM", require("ufo").closeAllFolds)
