local groups = require ("modular.autogroups")
local telescope_builtin = require ("telescope.builtin")
local utils = require ("modular.utils")

local leaders = {"gr", "<leader>l", "<leader>"}

local map = utils.map_multi_leader
local unmap = utils.unmap_multi_leader

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup (groups.LspAttachTelescopeMappings, { clear = true }),
	callback = function(args)
		map ("n", leaders, "fI", telescope_builtin.lsp_incoming_calls, { buffer = args.buf, desc = "incoming calls" })
		map ("n", leaders, "fO", telescope_builtin.lsp_outgoing_calls, { buffer = args.buf, desc = "outgoing calls" })
		map ("n", leaders, "fS", telescope_builtin.lsp_dynamic_workspace_symbols, { buffer = args.buf, desc = "workspace symbols" })
		map ("n", leaders, "fT", telescope_builtin.lsp_type_definitions, {buffer = args.buf, desc = "type definitions" })
		map ("n", leaders, "fd", telescope_builtin.lsp_definitions, { buffer = args.buf, desc = "definitions" })
		map ("n", leaders, "fi", telescope_builtin.lsp_implementations, { buffer = args.buf, desc = "implementations" })
		map ("n", leaders, "fr", telescope_builtin.lsp_references, { buffer = args.buf, desc = "references" })
		map ("n", leaders, "fs", telescope_builtin.lsp_document_symbols, { buffer = args.buf, desc = "document symbols" })
	end,
})

vim.api.nvim_create_autocmd('LspDetach', {
	group = vim.api.nvim_create_augroup (groups.LspDetachTelescopeMappings, { clear = true }),
	callback = function(args)
		unmap ("n", leaders, "fI", { buffer = args.buf })
		unmap ("n", leaders, "fO", { buffer = args.buf })
		unmap ("n", leaders, "fS", { buffer = args.buf })
		unmap ("n", leaders, "fT", { buffer = args.buf })
		unmap ("n", leaders, "fd", { buffer = args.buf })
		unmap ("n", leaders, "fi", { buffer = args.buf })
		unmap ("n", leaders, "fr", { buffer = args.buf })
		unmap ("n", leaders, "fs", { buffer = args.buf })
	end,
})
