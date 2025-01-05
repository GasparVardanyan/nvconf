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
	end,
})

