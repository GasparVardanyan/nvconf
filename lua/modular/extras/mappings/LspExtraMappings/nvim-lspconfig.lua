local groups = require ("modular.extras.autogroups")

local map = vim.keymap.set
local unmap = vim.keymap.del

vim.api.nvim_create_autocmd ("LspAttach", {
	group = vim.api.nvim_create_augroup (groups.ExtraLspAttachMappings, { clear = true }),
	callback = function(event)
		map("n", "gD", vim.lsp.buf.declaration, { buffer = event.buf })
		map("n", "gd", vim.lsp.buf.definition, { buffer = event.buf })
	end,
})

vim.api.nvim_create_autocmd ("LspDetach", {
	group = vim.api.nvim_create_augroup (groups.ExtraLspDetachMappings, { clear = true }),
	callback = function(event)
		unmap("n", "gD", { buffer = event.buf })
		unmap("n", "gd", { buffer = event.buf })
	end,
})
