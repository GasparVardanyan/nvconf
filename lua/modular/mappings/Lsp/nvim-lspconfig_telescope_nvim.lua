local groups = require ("modular.autogroups")
local telescope = require("telescope.builtin")

local map = vim.keymap.set
local unmap = vim.keymap.del

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup (groups.LspAttachTelescopeMappings, { clear = true }),
	callback = function(args)
		map ("n", "grfI", telescope.lsp_incoming_calls, { buffer = args.buf, desc = "incoming calls" })
		map ("n", "grfO", telescope.lsp_outgoing_calls, { buffer = args.buf, desc = "outgoing calls" })
		map ("n", "grfS", telescope.lsp_dynamic_workspace_symbols, { buffer = args.buf, desc = "workspace symbols" })
		map ("n", "grfT", telescope.lsp_type_definitions, {buffer = args.buf, desc = "type definitions" })
		map ("n", "grfd", telescope.lsp_definitions, { buffer = args.buf, desc = "definitions" })
		map ("n", "grfi", telescope.lsp_implementations, { buffer = args.buf, desc = "implementations" })
		map ("n", "grfr", telescope.lsp_references, { buffer = args.buf, desc = "references" })
		map ("n", "grfs", telescope.lsp_document_symbols, { buffer = args.buf, desc = "document symbols" })

		map ("n", "<leader>lfI", telescope.lsp_incoming_calls, { buffer = args.buf, desc = "incoming calls" })
		map ("n", "<leader>lfO", telescope.lsp_outgoing_calls, { buffer = args.buf, desc = "outgoing calls" })
		map ("n", "<leader>lfS", telescope.lsp_dynamic_workspace_symbols, { buffer = args.buf, desc = "workspace symbols" })
		map ("n", "<leader>lfT", telescope.lsp_type_definitions, {buffer = args.buf, desc = "type definitions" })
		map ("n", "<leader>lfd", telescope.lsp_definitions, { buffer = args.buf, desc = "definitions" })
		map ("n", "<leader>lfi", telescope.lsp_implementations, { buffer = args.buf, desc = "implementations" })
		map ("n", "<leader>lfr", telescope.lsp_references, { buffer = args.buf, desc = "references" })
		map ("n", "<leader>lfs", telescope.lsp_document_symbols, { buffer = args.buf, desc = "document symbols" })

		map ("n", "<leader>fI", telescope.lsp_incoming_calls, { buffer = args.buf, desc = "lsp incoming calls" })
		map ("n", "<leader>fO", telescope.lsp_outgoing_calls, { buffer = args.buf, desc = "lsp outgoing calls" })
		map ("n", "<leader>fS", telescope.lsp_dynamic_workspace_symbols, { buffer = args.buf, desc = "lsp workspace symbols" })
		map ("n", "<leader>fT", telescope.lsp_type_definitions, {buffer = args.buf, desc = "lsp type definitions" })
		map ("n", "<leader>fd", telescope.lsp_definitions, { buffer = args.buf, desc = "lsp definitions" })
		map ("n", "<leader>fi", telescope.lsp_implementations, { buffer = args.buf, desc = "lsp implementations" })
		map ("n", "<leader>fr", telescope.lsp_references, { buffer = args.buf, desc = "lsp references" })
		map ("n", "<leader>fs", telescope.lsp_document_symbols, { buffer = args.buf, desc = "lsp document symbols" })
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
