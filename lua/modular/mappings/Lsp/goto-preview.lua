local groups = require ("modular.autogroups")
local utils = require ("modular.utils")

local map = vim.keymap.set
local unmap = vim.keymap.del

vim.api.nvim_create_autocmd ("LspAttach", {
	group = vim.api.nvim_create_augroup (groups.LspAttachGotoPreviewMappings, { clear = true }),
	callback = function(event)
		map ("n", "grpd", function () require("goto-preview").goto_preview_definition() end, { buffer = event.buf, desc = "definition" })
		map ("n", "grpt", function () require("goto-preview").goto_preview_type_definition() end, { buffer = event.buf, desc = "type definition" })
		map ("n", "grpi", function () require("goto-preview").goto_preview_implementation() end, { buffer = event.buf, desc = "implementation" })
		map ("n", "grpD", function () require("goto-preview").goto_preview_declaration() end, { buffer = event.buf, desc = "declaration" })
		map ("n", "grP", function () require("goto-preview").close_all_win() end, { buffer = event.buf, desc = "lsp close preview windows" })
		map ("n", "grpr", function () require("goto-preview").goto_preview_references() end, { buffer = event.buf, desc = "references" })

		map ("n", "<leader>lpd", function () require("goto-preview").goto_preview_definition() end, { buffer = event.buf, desc = "definition" })
		map ("n", "<leader>lpt", function () require("goto-preview").goto_preview_type_definition() end, { buffer = event.buf, desc = "type definition" })
		map ("n", "<leader>lpi", function () require("goto-preview").goto_preview_implementation() end, { buffer = event.buf, desc = "implementation" })
		map ("n", "<leader>lpD", function () require("goto-preview").goto_preview_declaration() end, { buffer = event.buf, desc = "declaration" })
		map ("n", "<leader>lP", function () require("goto-preview").close_all_win() end, { buffer = event.buf, desc = "lsp close preview windows" })
		map ("n", "<leader>lpr", function () require("goto-preview").goto_preview_references() end, { buffer = event.buf, desc = "references" })
	end,
})

vim.api.nvim_create_autocmd("LspDetach", {
	group = vim.api.nvim_create_augroup (groups.LspDetachGotoPreviewMappings, { clear = true }),
	callback = function(event)
		unmap ("n", "grpd", { buffer = event.buf })
		unmap ("n", "grpt", { buffer = event.buf })
		unmap ("n", "grpi", { buffer = event.buf })
		unmap ("n", "grpD", { buffer = event.buf })
		unmap ("n", "grP", { buffer = event.buf })
		unmap ("n", "grpr", { buffer = event.buf })

		unmap ("n", "<leader>lpd", { buffer = event.buf })
		unmap ("n", "<leader>lpt", { buffer = event.buf })
		unmap ("n", "<leader>lpi", { buffer = event.buf })
		unmap ("n", "<leader>lpD", { buffer = event.buf })
		unmap ("n", "<leader>lP", { buffer = event.buf })
		unmap ("n", "<leader>lpr", { buffer = event.buf })
	end,
})
