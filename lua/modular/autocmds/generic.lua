local groups = require ("modular.autogroups")

vim.api.nvim_create_augroup (
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
		vim.cmd [[%s/\v(^\t*( {4})*)@<= {4}/\t/ge]]
		-- clear whitespaces at the ends of lines
		vim.cmd [[%s/\v\s+$//e]]
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

vim.api.nvim_create_autocmd ("VimLeavePre", {
	group = vim.api.nvim_create_augroup (groups.NvimVimLeavePreSessionSave, { clear = true }),
	callback = function ()
		vim.cmd [[
			if filereadable(".vim.session")
				silent mksession! .vim.session
			endif
		]]
	end,
})

vim.api.nvim_create_autocmd ("FileType", {
	group = vim.api.nvim_create_augroup (groups.NvimFormatHelpContents, { clear = true }),
	pattern = "qf",
	callback = function (args)
		-- TODO: FileType isn't the right place for this !!
		do return end

		local bufnr = args.buf

		vim.api.nvim_buf_set_option (bufnr, "modifiable", true)
		vim.cmd[[
			%g#^\v/usr/share/nvim/runtime/doc/[^|]+\|\d+\|# norm 0d2f|
		]]
		vim.api.nvim_buf_set_option (bufnr, "modifiable", false)
		vim.api.nvim_buf_set_option (bufnr, "number", false)
		vim.api.nvim_buf_set_option (bufnr, "relativenumber", false)
	end,
})
