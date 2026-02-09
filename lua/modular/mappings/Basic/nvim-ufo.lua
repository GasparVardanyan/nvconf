local map = vim.keymap.set

map ("n", "zR", require ("ufo").openAllFolds)
map ("n", "zM", require ("ufo").closeAllFolds)

map ("n", "K", function ()
	local winid = require ("ufo").peekFoldedLinesUnderCursor ()
	if not winid then
		vim.lsp.buf.hover ()
	end
end)
