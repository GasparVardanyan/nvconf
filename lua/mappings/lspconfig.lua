vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local map = vim.keymap.set
		local telescope_builtin = require("telescope.builtin")

		map('n', '<leader>fr', function()
			telescope_builtin.lsp_references()
		end, { desc = "LSP References" })
		map('n', '<leader>fi', function()
			telescope_builtin.lsp_implementations()
		end, { desc = "LSP Implementations" })
		map('n', '<leader>fd', function()
			telescope_builtin.lsp_definitions()
		end, { desc = "LSP Definitions" })
		map('n', '<leader>fs', function()
			telescope_builtin.lsp_document_symbols()
		end, { desc = "LSP Document Symbols" })
		map('n', '<leader>fW', function()
			telescope_builtin.lsp_workspace_symbols()
		end, { desc = "LSP Workspace Symbols" })
		map('n', '<leader>fD', function()
			telescope_builtin.diagnostics()
		end, { desc = "LSP Diagnostics" })
		map('n', '<leader>fI', function()
			telescope_builtin.lsp_incoming_calls()
		end, { desc = "LSP Incoming Calls" })
		map('n', '<leader>fO', function()
			telescope_builtin.lsp_outgoing_calls()
		end, { desc = "LSP Outgoing Calls" })

		map('n', '<leader>q', vim.cmd.ClangdSwitchSourceHeader)

		local function opts(desc)
			return { buffer = bufnr, desc = "LSP " .. desc }
		end

		map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
		map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
		map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
		map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Show signature help")
		map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
		map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")

		map("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts "List workspace folders")

		map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")
		-- map("n", "<leader>ra", require "nvchad.lsp.renamer", opts "NvRenamer")

		map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
		map("n", "gr", vim.lsp.buf.references, opts "Show references")
	end,
})

