local groups = require ("modular.autogroups")
local map = vim.keymap.set

if 1 == vim.fn.executable ("iwyu-tool") and 1 == vim.fn.executable ("iwyu-fix-includes")
then
	local reg_mapping_group = require ("modular.utils").reg_mapping_group
	reg_mapping_group ("<leader>Ch",  "headers")

	vim.api.nvim_create_autocmd ("FileType", {
		group = vim.api.nvim_create_augroup (groups.ClangIWYUMappings, { clear = true }),
		pattern = { "c", "cpp" },
		callback = function (args)
			local bufnr = args.buf
			map ("n", "<leader>Chc", vim.cmd.ClangIWYUCurrent, { buffer = bufnr, desc = "iwyu current file" })
			map ("n", "<leader>Chr", vim.cmd.ClangIWYURoot, { buffer = bufnr, desc = "iwyu root" })
		end
	})
end
