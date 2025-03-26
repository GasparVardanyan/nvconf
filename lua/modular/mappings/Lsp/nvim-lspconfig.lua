local map = vim.keymap.set
local unmap = vim.keymap.del

local function client_supports_method(client, method, bufnr)
	if vim.fn.has 'nvim-0.11' == 1 then
		return client:supports_method(method, bufnr)
	else
		return client.supports_method(method, { bufnr = bufnr })
	end
end

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(event)
		map("n", "<leader>la", vim.lsp.buf.code_action, { buffer = event.buf })
		map("n", "<leader>lgD", vim.lsp.buf.declaration, { buffer = event.buf })
		map("n", "<leader>lgd", vim.lsp.buf.definition, { buffer = event.buf })
		map("n", "<leader>lgi", vim.lsp.buf.implementation, { buffer = event.buf })
		map("n", "<leader>lgr", vim.lsp.buf.references, { buffer = event.buf })
		map("n", "<leader>lgt", vim.lsp.buf.type_definition, { buffer = event.buf })
		map("n", "<leader>lr", vim.lsp.buf.rename, { buffer = event.buf })
		map("n", "<leader>ls", vim.cmd.ClangdSwitchSourceHeader, { buffer = event.buf })
		map("n", "<leader>ls", vim.lsp.buf.signature_help, { buffer = event.buf })
		map("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, { buffer = event.buf })
		map("n", "<leader>lwl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, { buffer = event.buf })
		map("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, { buffer = event.buf })

		local client = vim.lsp.get_client_by_id(event.data.client_id)

		if nil then -- vim-illuminate does this
			-- TODO: if enabled, move to the appropriate autocmds file
			if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
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

		if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
			map("n", "<leader>lh", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
			end, { buffer = event.buf })

			map("n", "<leader>lH", function()
				-- vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
			end, { buffer = event.buf })
		end
	end,
})

vim.api.nvim_create_autocmd('LspDetach', {
	callback = function(event)
		unmap("n", "<leader>la", { buffer = event.buf })
		unmap("n", "<leader>lgD", { buffer = event.buf })
		unmap("n", "<leader>lgd", { buffer = event.buf })
		unmap("n", "<leader>lgi", { buffer = event.buf })
		unmap("n", "<leader>lgr", { buffer = event.buf })
		unmap("n", "<leader>lgt", { buffer = event.buf })
		unmap("n", "<leader>lr", { buffer = event.buf })
		unmap("n", "<leader>ls", { buffer = event.buf })
		unmap("n", "<leader>ls", { buffer = event.buf })
		unmap("n", "<leader>lwa", { buffer = event.buf })
		unmap("n", "<leader>lwl", { buffer = event.buf })
		unmap("n", "<leader>lwr", { buffer = event.buf })

		local client = vim.lsp.get_client_by_id(event.data.client_id)

		if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
			unmap("n", "<leader>gh", { buffer = event.buf })
			unmap("n", "<leader>gH", { buffer = event.buf })
		end
	end,
})
