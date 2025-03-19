vim.opt.cursorline = true
vim.api.nvim_create_autocmd ("InsertLeave", {
	callback = function ()
		vim.cmd [[set cursorline]]
	end,
})
vim.api.nvim_create_autocmd ("InsertEnter", {
	callback = function ()
		vim.cmd [[set nocursorline]]
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

vim.api.nvim_create_autocmd ({"BufNewFile", "BufReadPost"}, {
	pattern = {
		  "*.xdefaults"
		, "*.palette"
		, vim.fn.expand ("~") .. "/.local/etc/theme*"
		, vim.fn.expand ("~") .. "/.urxvt/config"
	},
	callback = function ()
		vim.cmd [[set syntax=xdefaults]]
	end,
})
