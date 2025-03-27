local groups = require ("modular.autogroups")

local cursor_line_highlight_autogroup = vim.api.nvim_create_augroup (
	groups.NvimCursorLineHighlight,
	{ clear = true }
)

vim.opt.cursorline = true
vim.api.nvim_create_autocmd ("InsertLeave", {
	group = groups.NvimCursorLineHighlight,
	callback = function ()
		vim.opt.cursorline = true
	end,
})
vim.api.nvim_create_autocmd ("InsertEnter", {
	group = groups.NvimCursorLineHighlight,
	callback = function ()
		vim.opt.cursorline = false
	end,
})

vim.api.nvim_create_autocmd ("BufReadPost", {
	group = vim.api.nvim_create_augroup (groups.NvimBufReadReturnToLastPos, { clear = true }),
	callback = function ()
		local last_line = vim.fn.line ("'\"")
		if last_line > 0 and last_line <= vim.fn.line ("$") then
			vim.cmd [[normal! g`"zvzz]]
		end
	end,
})

vim.api.nvim_create_autocmd ("BufWritePre", {
	group = vim.api.nvim_create_augroup (groups.NvimBufWritePreFormatting, { clear = true }),
	callback = function ()
		-- replace all 4 space indentations to tabs
		vim.cmd [[%s/\v(^\t*(    )*)@<=    /\t/ge]]
		-- clear whitespaces at the ends of lines
		vim.cmd [[%s/\s\+$//e]]
	end,
})

vim.api.nvim_create_autocmd ("TextYankPost", {
	group = vim.api.nvim_create_augroup (groups.NvimTextYankPostHighlight, { clear = true }),
	callback = function ()
		vim.highlight.on_yank ()
	end,
})

-- TODO: how to use with autogroups?
vim.api.nvim_create_user_command (
	"Messages",
	"new | put =execute('messages')",
	{}
)
