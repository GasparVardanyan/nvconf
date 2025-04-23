local groups = require ("modular.autogroups")
local utils = require ("modular.utils")

vim.api.nvim_create_autocmd ("LspAttach", {
	group = vim.api.nvim_create_augroup (groups.LspNativeCompletionAttachAutocmds, { clear = true }),
	callback = function (event)
		local client = vim.lsp.get_client_by_id (event.data.client_id)

		if client then
			if utils.client_supports_method (client, vim.lsp.protocol.Methods.textDocument_completion, event.buf) then
				vim.lsp.completion.enable (true, client.id, event.buf, { autotrigger = true })
			end
		end
	end,
})

vim.api.nvim_create_autocmd ("LspDetach", {
	group = vim.api.nvim_create_augroup (groups.LspNativeCompletionDetachAutocmds, { clear = true }),
	callback = function (event)
		local client = vim.lsp.get_client_by_id (event.data.client_id)

		if client and client:supports_method ('textDocument/completion') then
			vim.lsp.completion.enable (false, client.id, event.buf)
		end
	end,
})
