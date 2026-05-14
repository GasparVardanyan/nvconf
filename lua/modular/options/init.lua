vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.have_nerd_font = true
require ("modular.options.diagnostics")

-- vim.o.autocomplete = true

vim.o.background = "dark"

vim.o.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize"

vim.o.breakindent = true
vim.o.inccommand = 'split'
vim.o.confirm = true
-- vim.o.updatetime = 250

vim.o.foldmethod = "manual"
-- vim.o.foldmethod = "expr"
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
-- vim.o.foldenable = true

vim.o.colorcolumn = "81"
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.splitbelow = true
vim.o.splitright = true
-- vim.o.wildignore += "*.o,*.out,.git"
-- vim.o.updatetime = 250
vim.g.python_recommended_style = 0
vim.o.clipboard = ''
vim.o.expandtab = false
vim.o.exrc = true

vim.o.ignorecase = false
vim.o.smartcase = false

vim.o.completeopt = "menuone,noinsert,popup,fuzzy"
vim.o.winborder = "rounded"
vim.o.pumborder = "rounded"

vim.o.showtabline = 0

-- vim.o.conceallevel = 2

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.backup = true
vim.o.undodir = vim.fn.stdpath("state") .. "/undo/"
vim.o.backupdir = vim.fn.stdpath("state") .. "/backup/"
vim.o.directory = vim.fn.stdpath("state") .. "/swap/"
