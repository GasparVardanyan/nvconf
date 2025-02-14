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
vim.opt.updatetime = 250
vim.g.python_recommended_style = 0
vim.opt.clipboard = ''
vim.opt.expandtab = false
vim.opt.exrc = true

vim.opt.ignorecase = false
vim.opt.smartcase = false

vim.opt.showtabline = 0

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.cmd [[
	autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
	highlight ExtraWhitespace ctermbg=cyan guibg=cyan
	autocmd InsertLeave * redraw!
	match ExtraWhitespace /\s\+$\| \+\ze\t/
	autocmd BufWritePre * :%s/\s\+$//e

	autocmd BufWritePre * :%s/\(^\(    \)*\)\@<=    /\t/e

	augroup line_return
		au!
		au BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\     execute 'normal! g`"zvzz' |
			\ endif
	augroup END

	au BufNewFile,BufRead *.xdefaults,*.palette,~/.local/etc/theme*,~/.urxvt/config set syntax=xdefaults

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
