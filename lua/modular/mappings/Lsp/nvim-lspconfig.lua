local groups = require ("modular.autogroups")
local utils = require ("modular.utils")

local map = vim.keymap.set
local unmap = vim.keymap.del

-- Some keymaps are created unconditionally when Nvim starts:
-- - "grn" is mapped in Normal mode to |vim.lsp.buf.rename()|
-- - "gra" is mapped in Normal and Visual mode to |vim.lsp.buf.code_action()|
-- - "grr" is mapped in Normal mode to |vim.lsp.buf.references()|
-- - "gri" is mapped in Normal mode to |vim.lsp.buf.implementation()|
-- - "gO" is mapped in Normal mode to |vim.lsp.buf.document_symbol()|
-- - CTRL-S is mapped in Insert mode to |vim.lsp.buf.signature_help()|


vim.api.nvim_create_autocmd ("LspAttach", {
	group = vim.api.nvim_create_augroup (groups.LspAttachMappings, { clear = true }),
	callback = function(event)
		if 0 == vim.fn.has "nvim-0.11" then
			map ("n", "grn", vim.lsp.buf.rename, { buffer = event.buf })
			map ("n", "gra", vim.lsp.buf.code_action, { buffer = event.buf })
			map ("n", "grr", vim.lsp.buf.references, { buffer = event.buf })
			map ("n", "gri", vim.lsp.buf.implementation, { buffer = event.buf })
			map ("n", "gO", vim.lsp.buf.document_symbol, { buffer = event.buf })
		end
			map ({"n", "i"}, "<c-s>", vim.lsp.buf.signature_help, { buffer = event.buf })

		map ("n", "grD", vim.lsp.buf.declaration, { buffer = event.buf })
		map ("n", "grd", vim.lsp.buf.definition, { buffer = event.buf })
		map ("n", "grt", vim.lsp.buf.type_definition, { buffer = event.buf })
		map ("n", "grs", vim.cmd.ClangdSwitchSourceHeader, { buffer = event.buf })
		map ("n", "grwa", vim.lsp.buf.add_workspace_folder, { buffer = event.buf })
		map ("n", "grwl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, { buffer = event.buf })
		map ("n", "grwr", vim.lsp.buf.remove_workspace_folder, { buffer = event.buf })

		local client = vim.lsp.get_client_by_id (event.data.client_id)

		-- if client and client:supports_method ('textDocument/completion') then
		-- 	vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
		-- end

		if client and utils.client_supports_method (client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
			map ("n", "grh", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
			end, { buffer = event.buf })
		end
	end,
})

vim.api.nvim_create_autocmd("LspDetach", {
	group = vim.api.nvim_create_augroup (groups.LspDetachMappings, { clear = true }),
	callback = function(event)
		if 0 == vim.fn.has "nvim-0.11" then
			unmap ("n", "grn", { buffer = event.buf })
			unmap ("n", "gra", { buffer = event.buf })
			unmap ("n", "grr", { buffer = event.buf })
			unmap ("n", "gri", { buffer = event.buf })
			unmap ("n", "gO", { buffer = event.buf })
		end
			unmap ({"n", "i"}, "<c-s>", { buffer = event.buf })

		unmap ("n", "grD", { buffer = event.buf })
		unmap ("n", "grd", { buffer = event.buf })
		unmap ("n", "grt", { buffer = event.buf })
		unmap ("n", "grs", { buffer = event.buf })
		unmap ("n", "grwa", { buffer = event.buf })
		unmap ("n", "grwl", { buffer = event.buf })
		unmap ("n", "grwr", { buffer = event.buf })

		local client = vim.lsp.get_client_by_id (event.data.client_id)

		if client and utils.client_supports_method (client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
			unmap ("n", "grh", { buffer = event.buf })
		end
	end,
})
