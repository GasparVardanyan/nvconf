local groups = require ("modular.autogroups")
local FzfLua = require ("fzf-lua")
local utils = require ("modular.utils")

local leaders = {"gr", "<leader>l", "<leader>"}

local map = utils.map_multi_leader
local unmap = utils.unmap_multi_leader

vim.api.nvim_create_autocmd ("LspAttach", {
	group = vim.api.nvim_create_augroup (groups.LspAttachTelescopeMappings, { clear = true }),
	callback = function (args)
		map ("n", leaders, "fI", FzfLua.lsp_incoming_calls, { buffer = args.buf, desc = "incoming calls" })
		map ("n", leaders, "fO", FzfLua.lsp_outgoing_calls, { buffer = args.buf, desc = "outgoing calls" })
		-- map ("n", leaders, "fS", FzfLua.lsp_dynamic_workspace_symbols, { buffer = args.buf, desc = "workspace symbols" })
		map ("n", leaders, "fS", FzfLua.lsp_workspace_symbols, { buffer = args.buf, desc = "workspace symbols" })
		-- map ("n", leaders, "fT", FzfLua.lsp_type_definitions, {buffer = args.buf, desc = "type definitions" })
		map ("n", leaders, "fT", FzfLua.lsp_typedefs, {buffer = args.buf, desc = "type definitions" })
		map ("n", leaders, "fd", FzfLua.lsp_definitions, { buffer = args.buf, desc = "definitions" })
		map ("n", leaders, "fi", FzfLua.lsp_implementations, { buffer = args.buf, desc = "implementations" })
		map ("n", leaders, "fr", FzfLua.lsp_references, { buffer = args.buf, desc = "references" })
		map ("n", leaders, "fs", FzfLua.lsp_document_symbols, { buffer = args.buf, desc = "document symbols" })
	end,
})

vim.api.nvim_create_autocmd ("LspDetach", {
	group = vim.api.nvim_create_augroup (groups.LspDetachTelescopeMappings, { clear = true }),
	callback = function (args)
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
