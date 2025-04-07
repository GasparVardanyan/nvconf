local groups = require ("modular.autogroups")

local map = vim.keymap.set
local unmap = vim.keymap.del

vim.api.nvim_create_autocmd ('LspAttach', {
	group = vim.api.nvim_create_augroup (groups.LspAttachSagaMappings, { clear = true }),
	callback = function(event)
		map ("n", "<leader>Lo", "<cmd>Lspsaga outline<cr>", { buffer = event.buf,
			desc = "lspsaga outline"
		})
		map ("n", "<leader>Lh", "<cmd>Lspsaga hover_doc<cr>", { buffer = event.buf,
			desc = "lspsaga hover doc"
		})
		map ("n", "<leader>Ld", "<cmd>Lspsaga peek_definition<cr>", { buffer = event.buf,
			desc = "lspsaga peek definition"
		})
		map ("n", "<leader>Lt", "<cmd>Lspsaga peek_definition<cr>", { buffer = event.buf,
			desc = "lspsaga peek definition" -- TODO: something is wrong here
		})
	end,
})

vim.api.nvim_create_autocmd("LspDetach", {
	group = vim.api.nvim_create_augroup (groups.LspDetachSagaMappings, { clear = true }),
	callback = function(event)
		unmap ("n", "<leader>Lo", { buffer = event.buf })
		unmap ("n", "<leader>Lh", { buffer = event.buf })
		unmap ("n", "<leader>Ld", { buffer = event.buf })
		unmap ("n", "<leader>Lt", { buffer = event.buf })
	end,
})
