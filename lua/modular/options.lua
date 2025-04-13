vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.background = "dark"

vim.opt.breakindent = true
vim.opt.inccommand = 'split'
vim.opt.confirm = true
-- vim.opt.updatetime = 250

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

vim.g.have_nerd_font = true
vim.opt.completeopt = "menuone,noinsert,popup,fuzzy"
vim.o.winborder = "rounded"

-- vim.opt.showtabline = 0

-- vim.opt.conceallevel = 2

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.backup = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo/"
vim.opt.backupdir = vim.fn.stdpath("state") .. "/backup/"
vim.opt.directory = vim.fn.stdpath("state") .. "/swap/"
