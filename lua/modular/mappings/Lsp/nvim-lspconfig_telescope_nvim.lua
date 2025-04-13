local groups = require ("modular.autogroups")
local telescope_builtin = require ("telescope.builtin")


local map = vim.keymap.set
local unmap = vim.keymap.del

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup (groups.LspAttachTelescopeMappings, { clear = true }),
	callback = function(args)
		map ("n", "grfI", telescope_builtin.lsp_incoming_calls, { buffer = args.buf, desc = "incoming calls" })
		map ("n", "grfO", telescope_builtin.lsp_outgoing_calls, { buffer = args.buf, desc = "outgoing calls" })
		map ("n", "grfS", telescope_builtin.lsp_dynamic_workspace_symbols, { buffer = args.buf, desc = "workspace symbols" })
		map ("n", "grfT", telescope_builtin.lsp_type_definitions, {buffer = args.buf, desc = "type definitions" })
		map ("n", "grfd", telescope_builtin.lsp_definitions, { buffer = args.buf, desc = "definitions" })
		map ("n", "grfi", telescope_builtin.lsp_implementations, { buffer = args.buf, desc = "implementations" })
		map ("n", "grfr", telescope_builtin.lsp_references, { buffer = args.buf, desc = "references" })
		map ("n", "grfs", telescope_builtin.lsp_document_symbols, { buffer = args.buf, desc = "document symbols" })

		map ("n", "<leader>lfI", telescope_builtin.lsp_incoming_calls, { buffer = args.buf, desc = "incoming calls" })
		map ("n", "<leader>lfO", telescope_builtin.lsp_outgoing_calls, { buffer = args.buf, desc = "outgoing calls" })
		map ("n", "<leader>lfS", telescope_builtin.lsp_dynamic_workspace_symbols, { buffer = args.buf, desc = "workspace symbols" })
		map ("n", "<leader>lfT", telescope_builtin.lsp_type_definitions, {buffer = args.buf, desc = "type definitions" })
		map ("n", "<leader>lfd", telescope_builtin.lsp_definitions, { buffer = args.buf, desc = "definitions" })
		map ("n", "<leader>lfi", telescope_builtin.lsp_implementations, { buffer = args.buf, desc = "implementations" })
		map ("n", "<leader>lfr", telescope_builtin.lsp_references, { buffer = args.buf, desc = "references" })
		map ("n", "<leader>lfs", telescope_builtin.lsp_document_symbols, { buffer = args.buf, desc = "document symbols" })

		map ("n", "<leader>fI", telescope_builtin.lsp_incoming_calls, { buffer = args.buf, desc = "lsp incoming calls" })
		map ("n", "<leader>fO", telescope_builtin.lsp_outgoing_calls, { buffer = args.buf, desc = "lsp outgoing calls" })
		map ("n", "<leader>fS", telescope_builtin.lsp_dynamic_workspace_symbols, { buffer = args.buf, desc = "lsp workspace symbols" })
		map ("n", "<leader>fT", telescope_builtin.lsp_type_definitions, {buffer = args.buf, desc = "lsp type definitions" })
		map ("n", "<leader>fd", telescope_builtin.lsp_definitions, { buffer = args.buf, desc = "lsp definitions" })
		map ("n", "<leader>fi", telescope_builtin.lsp_implementations, { buffer = args.buf, desc = "lsp implementations" })
		map ("n", "<leader>fr", telescope_builtin.lsp_references, { buffer = args.buf, desc = "lsp references" })
		map ("n", "<leader>fs", telescope_builtin.lsp_document_symbols, { buffer = args.buf, desc = "lsp document symbols" })
	end,
})

vim.api.nvim_create_autocmd('LspDetach', {
	group = vim.api.nvim_create_augroup (groups.LspDetachTelescopeMappings, { clear = true }),
	callback = function(args)
		unmap ("n", "grfI", { buffer = args.buf })
		unmap ("n", "grfO", { buffer = args.buf })
		unmap ("n", "grfS", { buffer = args.buf })
		unmap ("n", "grfT", { buffer = args.buf })
		unmap ("n", "grfd", { buffer = args.buf })
		unmap ("n", "grfi", { buffer = args.buf })
		unmap ("n", "grfr", { buffer = args.buf })
		unmap ("n", "grfs", { buffer = args.buf })

		unmap ("n", "<leader>lfI", { buffer = args.buf })
		unmap ("n", "<leader>lfO", { buffer = args.buf })
		unmap ("n", "<leader>lfS", { buffer = args.buf })
		unmap ("n", "<leader>lfT", { buffer = args.buf })
		unmap ("n", "<leader>lfd", { buffer = args.buf })
		unmap ("n", "<leader>lfi", { buffer = args.buf })
		unmap ("n", "<leader>lfr", { buffer = args.buf })
		unmap ("n", "<leader>lfs", { buffer = args.buf })

		unmap ("n", "<leader>fI", { buffer = args.buf })
		unmap ("n", "<leader>fO", { buffer = args.buf })
		unmap ("n", "<leader>fS", { buffer = args.buf })
		unmap ("n", "<leader>fT", { buffer = args.buf })
		unmap ("n", "<leader>fd", { buffer = args.buf })
		unmap ("n", "<leader>fi", { buffer = args.buf })
		unmap ("n", "<leader>fr", { buffer = args.buf })
		unmap ("n", "<leader>fs", { buffer = args.buf })
	end,
})
