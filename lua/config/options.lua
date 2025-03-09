vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.foldmethod = "manual"
vim.opt.colorcolumn = "81"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
-- vim.opt.wildignore += "*.o,*.out,.git"
-- vim.opt.updatetime = 250
vim.g.python_recommended_style = 0
vim.opt.clipboard = ''
vim.opt.expandtab = false
vim.opt.exrc = true

vim.opt.ignorecase = false
vim.opt.smartcase = false

vim.opt.showtabline = 0

-- vim.opt.conceallevel = 2

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

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

vim.api.nvim_create_autocmd ({"BufNewFile", "BufReadPost"}, {
	pattern = {
		  "*.norg"
		, "*.org"
	},
	callback = function ()
		vim.cmd [[setlocal nonu nornu conceallevel=2]]
		vim.cmd [[IlluminateToggleBuf]]
	end,
})

vim.cmd [[
	command -range=% Encrypt execute "'<,'>!gcrypt -S -e \"$(pass show pdata)\" | base64"
	command -range=% Decrypt execute "'<,'>!base64 -d | gcrypt -S -d \"$(pass show pdata)\""

	set backup
	set undodir=~/.config/nvim/tmp/undo//
	set backupdir=~/.config/nvim/tmp/backup//
	set directory=~/.config/nvim/tmp/swap//

	if !isdirectory(expand(&undodir))
		call mkdir(expand(&undodir), "p")
	endif
	if !isdirectory(expand(&backupdir))
		call mkdir(expand(&backupdir), "p")
	endif
	if !isdirectory(expand(&directory))
		call mkdir(expand(&directory), "p")
	endif
]]
