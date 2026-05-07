local groups = require ("modular.autogroups")

local map = vim.keymap.set
local unmap = vim.keymap.del

vim.api.nvim_create_autocmd ("LspAttach", {
	group = vim.api.nvim_create_augroup (groups.LspAttachSagaMappings, { clear = true }),
	callback = function(event)
		map ("n", "<leader>lsDb", function () vim.cmd.Lspsaga "show_buf_diagnostics" end, { buffer = event.buf, desc = "show buf diagnostics" })
		map ("n", "<leader>lsDc", function () vim.cmd.Lspsaga "show_cursor_diagnostics" end, { buffer = event.buf, desc = "show cursor diagnostics" })
		map ("n", "<leader>lsDl", function () vim.cmd.Lspsaga "show_line_diagnostics" end, { buffer = event.buf, desc = "show line diagnostics" })
		map ("n", "<leader>lsDw", function () vim.cmd.Lspsaga "show_workspace_diagnostics" end, { buffer = event.buf, desc = "show workspace diagnostics" })
		map ("n", "<leader>lsDn", function () vim.cmd.Lspsaga "diagnostics_jump_next" end, { buffer = event.buf, desc = "diagnostics jump next" })
		map ("n", "<leader>lsDp", function () vim.cmd.Lspsaga "diagnostics_jump_prev" end, { buffer = event.buf, desc = "diagnostics jump prev" })
		map ("n", "<leader>lsca", function () vim.cmd.Lspsaga "code_action" end,  { buffer = event.buf, desc = "code action" })
		map ("n", "<leader>lsh", function () vim.cmd.Lspsaga "hover_doc" end,  { buffer = event.buf, desc = "hover doc" })
		map ("n", "<leader>lsff", function () vim.cmd.Lspsaga "finder" end,  { buffer = event.buf, desc = "finder" })
		map ("n", "<leader>lsfi", function () vim.cmd.Lspsaga "incoming_calls" end,  { buffer = event.buf, desc = "incoming calls" })
		map ("n", "<leader>lsfo", function () vim.cmd.Lspsaga "outgoing_calls" end,  { buffer = event.buf, desc = "outgoing calls" })
		map ("n", "<leader>lspd", function () vim.cmd.Lspsaga "peek_definition" end,  { buffer = event.buf, desc = "peek definition" })
		map ("n", "<leader>lspt", function () vim.cmd.Lspsaga "peek_type_definition" end,  { buffer = event.buf, desc = "peek type definition" })
		map ("n", "<leader>lsd", function () vim.cmd.Lspsaga "goto_definition" end,  { buffer = event.buf, desc = "goto definition" })
		map ("n", "<leader>lso", function () vim.cmd.Lspsaga "outline" end,  { buffer = event.buf, desc = "outline" })
		map ("n", "<leader>lsr", function () vim.cmd.Lspsaga "rename" end,  { buffer = event.buf, desc = "rename" })
		map ("n", "<leader>lsR", function () vim.cmd.Lspsaga "project_replace" end,  { buffer = event.buf, desc = "project replace" })
		map ("n", "<leader>lst", function () vim.cmd.Lspsaga "subtypes" end,  { buffer = event.buf, desc = "subtypes" })
		map ("n", "<leader>lsT", function () vim.cmd.Lspsaga "supertypes" end,  { buffer = event.buf, desc = "supertypes" })
	end,
})

vim.api.nvim_create_autocmd("LspDetach", {
	group = vim.api.nvim_create_augroup (groups.LspDetachSagaMappings, { clear = true }),
	callback = function(event)
		pcall (unmap, "n", "<leader>lsDb", { buffer = event.buf })
		pcall (unmap, "n", "<leader>lsDc", { buffer = event.buf })
		pcall (unmap, "n", "<leader>lsDl", { buffer = event.buf })
		pcall (unmap, "n", "<leader>lsDw", { buffer = event.buf })
		pcall (unmap, "n", "<leader>lsDn", { buffer = event.buf })
		pcall (unmap, "n", "<leader>lsDp", { buffer = event.buf })
		pcall (unmap, "n", "<leader>lsca", { buffer = event.buf })
		pcall (unmap, "n", "<leader>lsh", { buffer = event.buf })
		pcall (unmap, "n", "<leader>lsff", { buffer = event.buf })
		pcall (unmap, "n", "<leader>lsfi", { buffer = event.buf })
		pcall (unmap, "n", "<leader>lsfo", { buffer = event.buf })
		pcall (unmap, "n", "<leader>lspd", { buffer = event.buf })
		pcall (unmap, "n", "<leader>lspt", { buffer = event.buf })
		pcall (unmap, "n", "<leader>lsd", { buffer = event.buf })
		pcall (unmap, "n", "<leader>lso", { buffer = event.buf })
		pcall (unmap, "n", "<leader>lsr", { buffer = event.buf })
		pcall (unmap, "n", "<leader>lsR", { buffer = event.buf })
		pcall (unmap, "n", "<leader>lst", { buffer = event.buf })
		pcall (unmap, "n", "<leader>lsT", { buffer = event.buf })
	end,
})
