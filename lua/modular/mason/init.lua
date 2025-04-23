local MasonLspServers = require ("modular.mason.lspservers")

local MasonTools = vim.tbl_keys (MasonLspServers)
vim.list_extend (MasonTools, require ("modular.mason.tools"))

return MasonTools
