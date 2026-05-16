local map = vim.keymap.set

map ("n", "<Esc>", vim.cmd.noh, { desc = "general clear highlights" })

map ("i", "<c-s-h>", "<Left>", { desc = "move left" })
map ("i", "<c-s-j>", "<Down>", { desc = "move down" })
map ("i", "<c-s-k>", "<Up>", { desc = "move up" })
map ("i", "<c-s-l>", "<Right>", { desc = "move right" })
map ("i", "<c-l>", "<Del>", { desc = "delete" })
map ("i", "<c-h>", "<BS>", { desc = "backspace" })

map ("n", "<c-h>", "<c-w>h", { desc = "switch window left" })
map ("n", "<c-j>", "<c-w>j", { desc = "switch window down" })
map ("n", "<c-k>", "<c-w>k", { desc = "switch window up" })
map ("n", "<c-l>", "<c-w>l", { desc = "switch window right" })
map ("n", "<c-s-h>", "<c-w>H", { desc = "move window left" })
map ("n", "<c-s-j>", "<c-w>J", { desc = "move window down" })
map ("n", "<c-s-k>", "<c-w>K", { desc = "move window up" })
map ("n", "<c-s-l>", "<c-w>L", { desc = "move window right" })

map ("n", "<c-\\><c-\\>", vim.cmd.terminal, { desc = "terminal" })

map ("n", "<leader>V", "`[v`]", { desc = "vim `[v`]" })
map ("n", "<leader>vc", vim.cmd.tabclose, { desc = "tabclose" })
map ("n", "<leader>vd", vim.cmd.bdelete, { desc = "bdelete" })
map ("n", "<leader>vm", function () vim.cmd.tabnew "%"; vim.cmd.norm "zz" end, { desc = "tabnew %" }) -- TODO: proper encoding without binary symbols
map ("n", "<leader>vt", function ()
	if 0 == vim.o.showtabline
	then
		vim.o.showtabline = 1
	else
		vim.o.showtabline = 0
	end
end, { desc = "toggle tabline" })
map ("n", "<leader>vn", vim.cmd.tabnew, { desc = "tabnew" })
map ("n", "<leader>vw", vim.cmd.WipeWindowlessBufs, { desc = "wipe windowless bufs" })
map ("n", "<leader>vg", vim.cmd.GTabs, { desc = "gaspar tabs" })

-- TODO: use this instead of <cmd> in mappings:
		-- vim.cmd('echo "foo"')
		-- vim.cmd { cmd = 'echo', args = { '"foo"' } }
		-- vim.cmd.echo({ args = { '"foo"' } })
		-- vim.cmd.echo('"foo"')
-- map ("n", "<leader>n", "<cmd>setlocal nu! rnu!<cr>", { desc = "toggle line numbers" })
map ("n", "<leader>n", function () vim.cmd.setlocal {'nu!', 'rnu!'} end, { desc = "toggle line numbers" })

-- map ("t", "<C-x>", "<C-\\><C-N>", { desc = "escape terminal mode" })
-- map ("t", "<C-q>", "<C-\\><C-N>ZQ", { desc = "close terminal" })

vim.cmd [[
	noremap <F1> :mksession! .vim.session
	noremap <F2> :source .vim.session
	noremap <F3> :! rm .vim.session
]]
