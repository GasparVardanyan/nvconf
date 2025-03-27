local groups = require ("modular.autogroups")
local telescope = require("telescope.builtin")
local groups = require ("modular.autogroups")

local map = vim.keymap.set
local unmap = vim.keymap.del

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup (groups.LspAttachTelescopeMappings, { clear = true }),
	callback = function(args)

		map("n", "<leader>lfI", telescope.lsp_incoming_calls, { buffer = args.buf })
		map("n", "<leader>lfO", telescope.lsp_outgoing_calls, { buffer = args.buf })
		map("n", "<leader>lfS", telescope.lsp_dynamic_workspace_symbols, { buffer = args.buf })
		map("n", "<leader>lfT", telescope.lsp_type_definitions, {buffer = args.buf})
		map("n", "<leader>lfd", telescope.lsp_definitions, { buffer = args.buf })
		map("n", "<leader>lfi", telescope.lsp_implementations, { buffer = args.buf })
		map("n", "<leader>lfr", telescope.lsp_references, { buffer = args.buf })
		map("n", "<leader>lfs", telescope.lsp_document_symbols, { buffer = args.buf })
	end,
})

vim.api.nvim_create_autocmd('LspDetach', {
	group = vim.api.nvim_create_augroup (groups.LspDetachTelescopeMappings, { clear = true }),
	callback = function(args)
		unmap("n", "<leader>lfI", { buffer = args.buf })
		unmap("n", "<leader>lfO", { buffer = args.buf })
		unmap("n", "<leader>lfS", { buffer = args.buf })
		unmap("n", "<leader>lfT", { buffer = args.buf })
		unmap("n", "<leader>lfd", { buffer = args.buf })
		unmap("n", "<leader>lfi", { buffer = args.buf })
		unmap("n", "<leader>lfr", { buffer = args.buf })
		unmap("n", "<leader>lfs", { buffer = args.buf })
	end,
})
