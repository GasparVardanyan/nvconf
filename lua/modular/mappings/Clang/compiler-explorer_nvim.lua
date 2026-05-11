local map = vim.keymap.set
local groups = require ("modular.autogroups")

map ("n", "<leader>Cea", vim.cmd.CEAddLibrary, { desc = "add library" })
map ("n", "<leader>Cec", vim.cmd.CECompile, { desc = "compile" })
map ("n", "<leader>Cel", vim.cmd.CECompileLive, { desc = "live mode" })
map ("n", "<leader>Ces", function ()
	vim.cmd [[au! CompilerExplorerLive]]
end, { desc = "stop live mode" })
map ("n", "<leader>Ced", vim.cmd.CEDeleteCache, { desc = "delete cache" })
map ("n", "<leader>Cef", vim.cmd.CECompile, { desc = "format" })
map ("n", "<leader>Cee", vim.cmd.CECompile, { desc = "example" })
map ("n", "<leader>Cew", vim.cmd.CECompile, { desc = "website" })

vim.api.nvim_create_autocmd("BufFilePost", {
	group = vim.api.nvim_create_augroup (groups.ClangCELocalMappings, { clear = true }),
	callback = function(e)
		local name = vim.api.nvim_buf_get_name(e.buf)

		if not vim.startswith(name, "compiler-explorer://") then
			return
		end

		map ("n", "<localleader>g", vim.cmd.CEGotoLabel, { buf = e.buf, desc = "goto label" })
		map ("n", "<localleader>s", vim.cmd.CEShowTooltip, { buf = e.buf, desc = "show tooltip" })
	end,
})
