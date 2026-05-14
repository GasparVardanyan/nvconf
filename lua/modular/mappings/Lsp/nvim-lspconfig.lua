local groups = require ("modular.autogroups")
local utils = require ("modular.utils")

local map = vim.keymap.set
local unmap = vim.keymap.del

local leaders = {"gr", "<leader>l"}

vim.api.nvim_create_autocmd ("LspAttach", {
	group = vim.api.nvim_create_augroup (groups.LspAttachMappings, { clear = true }),
	callback = function(event)
		map ("n", "grD", vim.lsp.buf.declaration, { buffer = event.buf, desc = "declaration" })
		map ("n", "grd", vim.lsp.buf.definition, { buffer = event.buf, desc = "definition" })
		map ("n", "grs", vim.cmd.ClangdSwitchSourceHeader, { buffer = event.buf, desc = "switch source header" }) -- TODO: CLANG

		map ("n", "<c-s>", vim.lsp.buf.signature_help, { buffer = event.buf, desc = "signature help" })

		utils.map_multi_leader ("n", leaders, "wa", vim.lsp.buf.add_workspace_folder, { buffer = event.buf, desc = "add folder" })
		utils.map_multi_leader ("n", leaders, "wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, { buffer = event.buf, desc = "list folders" })
		utils.map_multi_leader ("n", leaders, "wr", vim.lsp.buf.remove_workspace_folder, { buffer = event.buf, desc = "remove folder" })

		local client = vim.lsp.get_client_by_id (event.data.client_id)

		-- TODO: REVIEW
		if client and utils.client_supports_method (client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
			map ("n", "grh", function()
				vim.lsp.inlay_hint.enable (not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
			end, { buffer = event.buf,
				desc = "toggle inlay hints"
			})
		end
	end,
})

vim.api.nvim_create_autocmd ("LspDetach", {
	group = vim.api.nvim_create_augroup (groups.LspDetachMappings, { clear = true }),
	callback = function(event)
		pcall (unmap, "n", "grD", { buffer = event.buf })
		pcall (unmap, "n", "grd", { buffer = event.buf })
		pcall (unmap, "n", "grs", { buffer = event.buf })

		pcall (unmap, "n", "<c-s>", { buffer = event.buf })

		pcall (utils.unmap_multi_leader, "n", leaders, "wa", { buffer = event.buf })
		pcall (utils.unmap_multi_leader, "n", leaders, "wl", { buffer = event.buf })
		pcall (utils.unmap_multi_leader, "n", leaders, "wr", { buffer = event.buf })

		local client = vim.lsp.get_client_by_id (event.data.client_id)

		if client and utils.client_supports_method (client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
			pcall (unmap, "n", "grh", { buffer = event.buf })
		end
	end,
})
