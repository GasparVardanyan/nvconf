vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(event)
		local map = vim.keymap.set
		local telescope_builtin = require("telescope.builtin")

		local function opts(desc)
			return { buffer = bufnr, desc = "LSP " .. desc }
		end

		-- TODO: CLEAN UP THIS MESS
		-- TODO: Use Trouble's Diagnostics window too

		map("n", "<leader>r", vim.lsp.buf.rename, opts "LSP Rename")
		map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Show signature help")
		map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
		map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")
		map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
		map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
		map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
		map('n', '<leader>q', vim.cmd.ClangdSwitchSourceHeader)

		map("n", "<leader>wl", function()
			-- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts "List workspace folders")

		map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")
		-- map("n", "<leader>ra", require "nvchad.lsp.renamer", opts "NvRenamer")

		map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
		map("n", "gr", vim.lsp.buf.references, opts "Show references")

		-- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
		---@param client vim.lsp.Client
		---@param method vim.lsp.protocol.Method
		---@param bufnr? integer some lsp support methods only in specific files
		---@return boolean
		local function client_supports_method(client, method, bufnr)
			if vim.fn.has 'nvim-0.11' == 1 then
				return client:supports_method(method, bufnr)
			else
				return client.supports_method(method, { bufnr = bufnr })
			end
		end

		if nil then -- vim-illuminate does this
			-- TODO: if enabled, move to the appropriate autocmds file

			-- The following two autocommands are used to highlight references of the
			-- word under your cursor when your cursor rests there for a little while.
			--    See `:help CursorHold` for information about when this is executed
			--
			-- When you move your cursor, the highlights will be cleared (the second autocommand).
			local client = vim.lsp.get_client_by_id(event.data.client_id)
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

		-- The following code creates a keymap to toggle inlay hints in your
		-- code, if the language server you are using supports them
		--
		-- This may be unwanted, since they displace some of your code
		if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
			map('<leader>th', function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
			end, '[T]oggle Inlay [H]ints')
		end
	end,
})
