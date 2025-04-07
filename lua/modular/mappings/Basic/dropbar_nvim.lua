local dropbar_api = require('dropbar.api')
local map = vim.keymap.set

map ("n", "<Leader>;", dropbar_api.pick, { desc = "pick" })
map ("n", "[;", dropbar_api.goto_context_start, { desc = "goto context start" })
map ("n", "];", dropbar_api.select_next_context, { desc = "select next context" })
