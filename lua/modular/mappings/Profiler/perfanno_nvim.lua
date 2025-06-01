local map = vim.keymap.set

map ("n", "<leader>plf", vim.cmd.PerfLoadFlat, { desc = "perf load flat" })
map ("n", "<leader>plg", vim.cmd.PerfLoadCallGraph, { desc = "perf load call graph" })
map ("n", "<leader>plo", vim.cmd.PerfLoadFlameGraph, { desc = "perf load flame graph" })
map ("n", "<leader>pe", vim.cmd.PerfPickEvent, { desc = "perf pick event" })
map ("n", "<leader>pa", vim.cmd.PerfAnnotate, { desc = "perf annotate" })
map ("n", "<leader>pf", vim.cmd.PerfAnnotateFunction, { desc = "perf annotate function" })
map ("v", "<leader>pa", vim.cmd.PerfAnnotateSelection, { desc = "perf annotate selection" })
map ("n", "<leader>pt", vim.cmd.PerfToggleAnnotations, { desc = "perf toggle annotations" })
map ("n", "<leader>ph", vim.cmd.PerfHottestLines, { desc = "perf hottest lines" })
map ("n", "<leader>ps", vim.cmd.PerfHottestSymbols, { desc = "perf hottest symbols" })
map ("n", "<leader>pc", vim.cmd.PerfHottestCallersFunction, { desc = "perf hottest callers function" })
map ("v", "<leader>pc", vim.cmd.PerfHottestCallersSelection, { desc = "perf hottest callers selection" })
