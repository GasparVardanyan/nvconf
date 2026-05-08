local groups = require ("modular.autogroups")

if 1 == vim.fn.executable ("iwyu-tool") and 1 == vim.fn.executable ("iwyu-fix-includes")
then
	local nproc = require ("modular.utils").nproc
	local iwyu_current
	local iwyu_root

	if 0 ~= nproc
	then
		iwyu_current = "w | !iwyu-tool -p . -j " .. nproc .. " % | iwyu-fix-includes"
		iwyu_root = "w | !iwyu-tool -p . -j " .. nproc .. " | iwyu-fix-includes"
	else
		iwyu_current = "w | !iwyu-tool -p . % | iwyu-fix-includes"
		iwyu_root = "w | !iwyu-tool -p . | iwyu-fix-includes"
	end

	vim.api.nvim_create_autocmd ("FileType", {
		group = vim.api.nvim_create_augroup (groups.ClangIWYU, { clear = true }),
		pattern = { "cpp" },
		callback = function (args)
			local bufnr = args.buf
				vim.api.nvim_buf_create_user_command (bufnr, "ClangIWYUCurrent",
					function () vim.cmd (iwyu_current) end, { nargs = 0 }
				)

				vim.api.nvim_buf_create_user_command (bufnr, "ClangIWYURoot",
					function () vim.cmd (iwyu_root) end, { nargs = 0 }
				)
		end
	})
end
