local map = vim.keymap.set

map ("n", "<leader>Ca", vim.cmd.ClangdAST, { desc = "ast" })
map ("n", "<leader>CM", vim.cmd.ClangdMemoryUsage, { desc = "memory usage" })
map ("n", "<leader>Ci", vim.cmd.ClangdSymbolInfo, { desc = "symbol info" })
map ("n", "<leader>Ct", vim.cmd.ClangdTypeHierarchy, { desc = "type hierarchy" })
