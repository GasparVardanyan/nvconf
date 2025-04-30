local map = vim.keymap.set

map ("n", "<Esc>", vim.cmd.noh, { desc = "general clear highlights" })

map ("i", "<c-h>", "<Left>", { desc = "move left" })
map ("i", "<c-j>", "<Down>", { desc = "move down" })
map ("i", "<c-k>", "<Up>", { desc = "move up" })
map ("i", "<c-l>", "<Right>", { desc = "move right" })
map ("i", "<c-s-l>", "<Del>", { desc = "delete" })
map ("i", "<c-s-h>", "<BS>", { desc = "backspace" })

map ("n", "<c-h>", "<c-w>h", { desc = "switch window left" })
map ("n", "<c-j>", "<c-w>j", { desc = "switch window down" })
map ("n", "<c-k>", "<c-w>k", { desc = "switch window up" })
map ("n", "<c-l>", "<c-w>l", { desc = "switch window right" })
map ("n", "<c-s-h>", "<c-w>H", { desc = "move window left" })
map ("n", "<c-s-j>", "<c-w>J", { desc = "move window down" })
map ("n", "<c-s-k>", "<c-w>K", { desc = "move window up" })
map ("n", "<c-s-l>", "<c-w>L", { desc = "move window right" })

map ("n", "<leader>V", "`[v`]", { desc = "vim `[v`]" })
map ("n", "<leader>vc", vim.cmd.tabclose, { desc = "tabclose" })
map ("n", "<leader>vd", vim.cmd.bdelete, { desc = "bdelete" })
map ("n", "<leader>vm", function () vim.cmd.tabnew "%"; vim.cmd.norm "zz" end, { desc = "tabnew %" }) -- TODO: proper encoding without binary symbols
map ("n", "<leader>vn", vim.cmd.tabnew, { desc = "tabnew" })
map ("n", "<leader>vo", vim.cmd.only, { desc = "only" })
map ("n", "<leader>vw", vim.cmd.WipeWindowlessBufs, { desc = "wipe windowless bufs" })

-- TODO: use this instead of <cmd> in mappings:
		-- vim.cmd('echo "foo"')
		-- vim.cmd { cmd = 'echo', args = { '"foo"' } }
		-- vim.cmd.echo({ args = { '"foo"' } })
		-- vim.cmd.echo('"foo"')
-- map ("n", "<leader>n", "<cmd>setlocal nu! rnu!<cr>", { desc = "toggle line numbers" })
map ("n", "<leader>n", function () vim.cmd.setlocal {'nu!', 'rnu!'} end, { desc = "toggle line numbers" })

map ("t", "<C-x>", "<C-\\><C-N>", { desc = "escape terminal mode" })
map ("t", "<C-q>", "<C-\\><C-N>ZQ", { desc = "close terminal" })

-- TODO: conform these leaders:
--
-- <leader>v - native vim
-- <leader>V - native vim
--
-- <leader><space> - Basic - todo
-- <leader>s - Basic - grug-far
-- <leader>S - Basic - grug-far
-- <leader>f - Basic,Lsp - telescope
-- <leader>F - Basic - telescope
-- <leader>t - Basic - toggleterm
-- <leader>u - Basic - undotree
--
-- <leader>c - Compiler
-- <leader>C - Compiler
--
-- <leader>d - Dap - dap
-- <leader>df - Dap - dap telescope
--
-- <leader>D - Db - dadbod
--
-- <leader>g - Git
--
-- <leader>f - Basic,Lsp - telescope
-- <leader>l - Lsp
-- <leader>lf - Lsp - telescope
-- <leader>lx - Lsp - trouble
-- <leader>L - Lsp - LspSaga
-- gr - Lsp - native
-- <leader>lo - Lsp - outline
--
-- <leader>N - Org - neorg
--
-- TODO: keep for the future
--
-- <leader>a - Ai - avante
-- <leader>l - Lint
-- <leader>T - Test

vim.cmd [[
	noremap <F1> :mksession! .vim.session
	noremap <F2> :source .vim.session
	noremap <F3> :! rm .vim.session
]]
