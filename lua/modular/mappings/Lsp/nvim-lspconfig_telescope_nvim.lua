vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local map = vim.keymap.set
		local builtin = require("telescope.builtin")

		map("n", "<leader>fI", builtin.lsp_incoming_calls, { buffer = args.buf })
		map("n", "<leader>fO", builtin.lsp_outgoing_calls, { buffer = args.buf })
		map("n", "<leader>fS", builtin.lsp_dynamic_workspace_symbols, { buffer = args.buf })
		map("n", "<leader>fT", builtin.lsp_type_definitions, {buffer = args.buf})
		map("n", "<leader>fd", builtin.lsp_definitions, { buffer = args.buf })
		map("n", "<leader>fi", builtin.lsp_implementations, { buffer = args.buf })
		map("n", "<leader>fr", builtin.lsp_references, { buffer = args.buf })
		map("n", "<leader>fs", builtin.lsp_document_symbols, { buffer = args.buf })
	end,
})

vim.api.nvim_create_autocmd('LspDetach', {
	callback = function(args)
		local unmap = vim.keymap.del

		unmap("n", "<leader>fI", { buffer = args.buf })
		unmap("n", "<leader>fO", { buffer = args.buf })
		unmap("n", "<leader>fS", { buffer = args.buf })
		unmap("n", "<leader>fT", { buffer = args.buf })
		unmap("n", "<leader>fd", { buffer = args.buf })
		unmap("n", "<leader>fi", { buffer = args.buf })
		unmap("n", "<leader>fr", { buffer = args.buf })
		unmap("n", "<leader>fs", { buffer = args.buf })
	end,
})
