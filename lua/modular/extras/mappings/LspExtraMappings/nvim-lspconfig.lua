local map = vim.keymap.set
local unmap = vim.keymap.del

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(event)
		map("n", "gD", vim.lsp.buf.declaration, { buffer = event.buf })
		map("n", "gd", vim.lsp.buf.definition, { buffer = event.buf })
		map("n", "gi", vim.lsp.buf.implementation, { buffer = event.buf })
		map("n", "gr", vim.lsp.buf.references, { buffer = event.buf })
	end,
})

vim.api.nvim_create_autocmd('LspDetach', {
	callback = function(event)
		unmap("n", "gD", { buffer = event.buf })
		unmap("n", "gd", { buffer = event.buf })
		unmap("n", "gi", { buffer = event.buf })
		unmap("n", "gr", { buffer = event.buf })
	end,
})
