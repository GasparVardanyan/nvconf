local groups = require ("modular.autogroups")
local utils = require ("modular.utils")

local leaders = {"gr", "<leader>l"}

local map = utils.map_multi_leader
local unmap = utils.unmap_multi_leader

-- local map = vim.keymap.set
-- local unmap = vim.keymap.del

vim.api.nvim_create_autocmd ("LspAttach", {
	group = vim.api.nvim_create_augroup (groups.LspAttachGotoPreviewMappings, { clear = true }),
	callback = function(event)
		local opts = {
			focus_on_open = true,
			dismiss_on_move = false
		}
		map ("n", leaders, "pd", function () require("goto-preview").goto_preview_definition (opts) end, { buffer = event.buf, desc = "definition" })
		map ("n", leaders, "pt", function () require("goto-preview").goto_preview_type_definition (opts) end, { buffer = event.buf, desc = "type definition" })
		map ("n", leaders, "pi", function () require("goto-preview").goto_preview_implementation (opts) end, { buffer = event.buf, desc = "implementation" })
		map ("n", leaders, "pD", function () require("goto-preview").goto_preview_declaration (opts) end, { buffer = event.buf, desc = "declaration" })
		map ("n", leaders, "P", function () require("goto-preview").close_all_win () end, { buffer = event.buf, desc = "lsp close preview windows" })
		map ("n", leaders, "pr", function () require("goto-preview").goto_preview_references (opts) end, { buffer = event.buf, desc = "references" })
	end,
})

vim.api.nvim_create_autocmd("LspDetach", {
	group = vim.api.nvim_create_augroup (groups.LspDetachGotoPreviewMappings, { clear = true }),
	callback = function(event)
		unmap ("n", leaders, "pd", { buffer = event.buf })
		unmap ("n", leaders, "pt", { buffer = event.buf })
		unmap ("n", leaders, "pi", { buffer = event.buf })
		unmap ("n", leaders, "pD", { buffer = event.buf })
		unmap ("n", leaders, "P", { buffer = event.buf })
		unmap ("n", leaders, "pr", { buffer = event.buf })
	end,
})
