vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local map = vim.keymap.set
		local builtin = require("telescope.builtin")

		map("n", "<leader>lfI", builtin.lsp_incoming_calls, { buffer = args.buf })
		map("n", "<leader>lfO", builtin.lsp_outgoing_calls, { buffer = args.buf })
		map("n", "<leader>lfS", builtin.lsp_dynamic_workspace_symbols, { buffer = args.buf })
		map("n", "<leader>lfT", builtin.lsp_type_definitions, {buffer = args.buf})
		map("n", "<leader>lfd", builtin.lsp_definitions, { buffer = args.buf })
		map("n", "<leader>lfi", builtin.lsp_implementations, { buffer = args.buf })
		map("n", "<leader>lfr", builtin.lsp_references, { buffer = args.buf })
		map("n", "<leader>lfs", builtin.lsp_document_symbols, { buffer = args.buf })
	end,
})

vim.api.nvim_create_autocmd('LspDetach', {
	callback = function(args)
		local unmap = vim.keymap.del

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
