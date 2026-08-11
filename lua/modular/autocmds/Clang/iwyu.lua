local groups = require ("modular.autogroups")

if 1 == vim.fn.executable ("iwyu-tool") and 1 == vim.fn.executable ("iwyu-fix-includes")
then
	local nproc = require ("modular.utils").nproc
	local iwyu_current
	local iwyu_root

	if 0 ~= nproc
	then
		iwyu_current = "iwyu-tool -p . -j " .. (nproc - 1) .. " %"
		iwyu_root = "iwyu-tool -p . -j " .. (nproc - 1)
	else
		iwyu_current = "iwyu-tool -p . %"
		iwyu_root = "iwyu-tool -p ."
	end

	local function iwyu_opts ()
		local opts = {" "}

		if 1 == vim.fn.file_readable (".iwyu_options")
		then
			local lines = vim.fn.readfile (".iwyu_options")
			for _, line in ipairs (lines) do
				if line ~= "" then
					table.insert (opts, line)
					vim.print ("LINE: " .. line)
				else
					vim.print ("EL")
				end
			end
		else
			vim.print ("NF")
		end

		return table.concat (opts, " ")
	end

	vim.api.nvim_create_autocmd ("FileType", {
		group = vim.api.nvim_create_augroup (groups.ClangIWYU, { clear = true }),
		pattern = { "c", "cpp" },
		callback = function (args)
			local bufnr = args.buf
				vim.api.nvim_buf_create_user_command (bufnr, "ClangIWYUCurrent",
					function ()
						vim.cmd ("w | !" .. iwyu_current .. iwyu_opts () .. " | iwyu-fix-includes")
					end, { nargs = 0 }
				)

				vim.api.nvim_buf_create_user_command (bufnr, "ClangIWYURoot",
					function ()
						vim.cmd ("w | !" .. iwyu_root .. iwyu_opts () .. " | iwyu-fix-includes")
					end, { nargs = 0 }
				)
		end
	})
end
