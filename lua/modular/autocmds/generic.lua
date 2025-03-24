vim.opt.cursorline = true
vim.api.nvim_create_autocmd ("InsertLeave", {
	callback = function ()
		vim.opt.cursorline = true
	end,
})
vim.api.nvim_create_autocmd ("InsertEnter", {
	callback = function ()
		vim.opt.cursorline = false
	end,
})

vim.api.nvim_create_autocmd ("BufReadPost", {
	callback = function ()
		local last_line = vim.fn.line ("'\"")
		if last_line > 0 and last_line <= vim.fn.line ("$") then
			vim.cmd [[normal! g`"zvzz]]
		end
	end,
})

vim.api.nvim_create_autocmd ("BufWritePre", {
	callback = function ()
		vim.cmd [[%s/\v(^\t*(    )*)@<=    /\t/ge]]
		vim.cmd [[%s/\s\+$//e]]
	end,
})

vim.api.nvim_create_autocmd ("TextYankPost", {
  callback = function ()
	vim.highlight.on_yank ()
  end,
})

vim.api.nvim_create_user_command (
	"Messages",
	"new | put =execute('messages')",
	{}
)
