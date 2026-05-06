local groups = require ("modular.autogroups")
local utils = require ("modular.utils")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup (groups.LspAttachAutocmds, { clear = true }),
	callback = function(event)
		local client = vim.lsp.get_client_by_id (event.data.client_id)

		if client then
			if utils.client_supports_method (client, vim.lsp.protocol.Methods.textDocument_completion, event.buf) then
				vim.lsp.completion.enable (true, client.id, event.buf, { autotrigger = true })
			end

			if utils.client_supports_method (client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
				vim.lsp.inlay_hint.enable (true)
			end

			do return end -- NOTE: currently illiminate provides jumps to next instance

			if utils.client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
				local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
				vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
					buffer = event.buf,
					group = highlight_augroup,
					callback = vim.lsp.buf.document_highlight,
				})

				vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
					buffer = event.buf,
					group = highlight_augroup,
					callback = vim.lsp.buf.clear_references,
				})

				vim.api.nvim_create_autocmd('LspDetach', {
					group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
					callback = function(event2)
						vim.lsp.buf.clear_references()
						vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
					end,
				})
			end
		end
	end,
})

vim.api.nvim_create_autocmd("LspDetach", {
	group = vim.api.nvim_create_augroup (groups.LspDetachAutocmds, { clear = true }),
	callback = function(event)
		local client = vim.lsp.get_client_by_id (event.data.client_id)
		if client and client:supports_method ('textDocument/completion') then
			vim.lsp.completion.enable (false, client.id, event.buf)
		end

		-- TODO: why?
		if client and utils.client_supports_method (client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
			vim.lsp.inlay_hint.enable (false)
		end
	end,
})
