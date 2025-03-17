local map = vim.keymap.set

map('n', '<leader>S', function ()
	require("grug-far").open({ transient = true })
end, {
		desc = "Open Grug"
	})

map('n', '<leader>sw', function ()
	require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
end, {
		desc = "Search current word"
	})

map('v', '<leader>sw', function ()
	require("grug-far").with_visual_selection({ prefills = { transient = true } })
end, {
		desc = "Search current word"
	})

map('n', '<leader>sp', function ()
	require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })
end, {
		desc = "Search on current file"
	})
