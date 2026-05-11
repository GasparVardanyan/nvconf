return {
	"krady21/compiler-explorer.nvim",
	config = function ()
		require ("compiler-explorer").setup ({
			url = "https://godbolt.org",
			infer_lang = true, -- Try to infer possible language based on file extension.
			line_match = {
				highlight = true, -- highlight the matching line(s) in the other buffer.
				jump = true, -- move the cursor in the other buffer to the first matching line.
			},
			open_qflist = true, --  Open qflist after compilation if there are diagnostics.
			split = "split", -- How to split the window after the second compile (split/vsplit).
			compiler_flags = "", -- Default flags passed to the compiler.
			job_timeout_ms = 25000, -- Timeout for libuv job in milliseconds.
			languages = { -- Language specific default compiler/flags
				-- cpp = {
				-- 	compiler = "clang2210-80",
				-- 	compiler_flags = "-std=c++20 -Wall -Wextra -Werror=pedantic --pedantic-errors",
				-- },
			},
		})
	end,
}

