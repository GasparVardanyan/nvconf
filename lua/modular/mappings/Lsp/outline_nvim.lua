local groups = require ("modular.autogroups")
local utils = require ("modular.utils")

local leaders = {"gr", "<leader>l"}

local map = utils.map_multi_leader
local unmap = utils.unmap_multi_leader

vim.api.nvim_create_autocmd ("LspAttach", {
	group = vim.api.nvim_create_augroup (groups.LspAttachOutlineMappings, { clear = true }),
	callback = function(args)
		map ("n", leaders, "ot", vim.cmd.Outline, { buffer = args.buf, desc = "toggle" })
		map ("n", leaders, "of", vim.cmd.OutlineFocus, { buffer = args.buf, desc = "focus" })
	end,
})

vim.api.nvim_create_autocmd("LspDetach", {
	group = vim.api.nvim_create_augroup (groups.LspDetachOutlineMappings, { clear = true }),
	callback = function(args)
		unmap ("n", leaders, "ot", { buffer = args.buf })
		unmap ("n", leaders, "of", { buffer = args.buf })
	end,
})
