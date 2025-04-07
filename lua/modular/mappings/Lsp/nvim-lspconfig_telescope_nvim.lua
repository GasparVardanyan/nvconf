local groups = require ("modular.autogroups")
local telescope = require("telescope.builtin")

local map = vim.keymap.set
local unmap = vim.keymap.del

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup (groups.LspAttachTelescopeMappings, { clear = true }),
	callback = function(args)
		-- TODO: clean this mess

		map ("n", "<leader>lfI", telescope.lsp_incoming_calls, { buffer = args.buf, desc = "lsp telescope incoming calls" })
		map ("n", "<leader>lfO", telescope.lsp_outgoing_calls, { buffer = args.buf, desc = "lsp telescope outgoing calls" })
		map ("n", "<leader>lfS", telescope.lsp_dynamic_workspace_symbols, { buffer = args.buf, desc = "lsp telescope workspace symbols" })
		map ("n", "<leader>lfT", telescope.lsp_type_definitions, {buffer = args.buf, desc = "lsp telescope type definitions" })
		map ("n", "<leader>lfd", telescope.lsp_definitions, { buffer = args.buf, desc = "lsp telescope definitions" })
		map ("n", "<leader>lfi", telescope.lsp_implementations, { buffer = args.buf, desc = "lsp telescope implementations" })
		map ("n", "<leader>lfr", telescope.lsp_references, { buffer = args.buf, desc = "lsp telescope references" })
		map ("n", "<leader>lfs", telescope.lsp_document_symbols, { buffer = args.buf, desc = "lsp telescope document symbols" })

		map ("n", "<leader>fI", telescope.lsp_incoming_calls, { buffer = args.buf, desc = "lsp telescope incoming calls" })
		map ("n", "<leader>fO", telescope.lsp_outgoing_calls, { buffer = args.buf, desc = "lsp telescope outgoing calls" })
		map ("n", "<leader>fS", telescope.lsp_dynamic_workspace_symbols, { buffer = args.buf, desc = "lsp telescope workspace symbols" })
		map ("n", "<leader>fT", telescope.lsp_type_definitions, {buffer = args.buf, desc = "lsp telescope type definitions" })
		map ("n", "<leader>fd", telescope.lsp_definitions, { buffer = args.buf, desc = "lsp telescope definitions" })
		map ("n", "<leader>fi", telescope.lsp_implementations, { buffer = args.buf, desc = "lsp telescope implementations" })
		map ("n", "<leader>fr", telescope.lsp_references, { buffer = args.buf, desc = "lsp telescope references" })
		map ("n", "<leader>fs", telescope.lsp_document_symbols, { buffer = args.buf, desc = "lsp telescope document symbols" })

		-- map ("n", "<leader>sI", telescope.lsp_incoming_calls, { buffer = args.buf })
		-- map ("n", "<leader>sO", telescope.lsp_outgoing_calls, { buffer = args.buf })
		-- map ("n", "<leader>sS", telescope.lsp_dynamic_workspace_symbols, { buffer = args.buf })
		-- map ("n", "<leader>sT", telescope.lsp_type_definitions, {buffer = args.buf})
		-- map ("n", "<leader>sd", telescope.lsp_definitions, { buffer = args.buf })
		-- map ("n", "<leader>si", telescope.lsp_implementations, { buffer = args.buf })
		-- map ("n", "<leader>sr", telescope.lsp_references, { buffer = args.buf })
		-- map ("n", "<leader>ss", telescope.lsp_document_symbols, { buffer = args.buf })
	end,
})

vim.api.nvim_create_autocmd('LspDetach', {
	group = vim.api.nvim_create_augroup (groups.LspDetachTelescopeMappings, { clear = true }),
	callback = function(args)
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

		-- unmap ("n", "<leader>sI", { buffer = args.buf })
		-- unmap ("n", "<leader>sO", { buffer = args.buf })
		-- unmap ("n", "<leader>sS", { buffer = args.buf })
		-- unmap ("n", "<leader>sT", { buffer = args.buf })
		-- unmap ("n", "<leader>sd", { buffer = args.buf })
		-- unmap ("n", "<leader>si", { buffer = args.buf })
		-- unmap ("n", "<leader>sr", { buffer = args.buf })
		-- unmap ("n", "<leader>ss", { buffer = args.buf })
	end,
})
