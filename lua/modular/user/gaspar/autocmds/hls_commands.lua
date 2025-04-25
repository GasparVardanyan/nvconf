local groups = require ("modular.user.gaspar.autogroups")

vim.api.nvim_create_autocmd ("FileType", {
	group = vim.api.nvim_create_augroup (groups.UserGasparHlsCommands, { clear = true }),
	pattern = { "hlsplaylist" },
	callback = function (args)
		local bufnr = args.buf

		vim.api.nvim_buf_create_user_command (bufnr, "GetM3UHeader",
			function()
				vim.cmd [[
				norm O#EXTINF:,j0f=lvg_"*yk
				read !mediainfo --Output='General;\%Track\%' -- "$(xsel -op)".*
				norm kgJjj
				]]
			end, { nargs = 0 }
		)

		vim.api.nvim_buf_create_user_command (bufnr, "GetM3UHeaderOPUS",
			function ()
				vim.cmd [[
					norm O#EXTINF:,j0f=lvg_"*yk
					read !mediainfo --Output='General;\%Track\%' -- "$(xsel -op)".opus
					norm kgJjj
				]]
			end, { nargs = 0 }
		)

		vim.api.nvim_buf_create_user_command (bufnr, "GetM3UHeaderM4A",
			function ()
				vim.cmd [[
					norm O#EXTINF:,j0f=lvg_"*yk
					read !mediainfo --Output='General;\%Track\%' -- "$(xsel -op)".m4a
					norm kgJjj
				]]
			end, { nargs = 0 }
		)

		vim.api.nvim_buf_create_user_command (bufnr, "GetM3UHeaderMKV",
			function ()
				vim.cmd [[
					norm O#EXTINF:,j0f=lvg_"*yk
					read !mediainfo --Output='General;\%Movie\%' -- "$(xsel -op)".mkv
					norm kgJjj
				]]
			end, { nargs = 0 }
		)

		vim.api.nvim_buf_create_user_command (bufnr, "GetM3UHeaderMP4",
			function ()
				vim.cmd [[
					norm O#EXTINF:,j0f=lvg_"*yk
					read !mediainfo --Output='General;\%Movie\%' -- "$(xsel -op)".mp4
					norm kgJjj
				]]
			end, { nargs = 0 }
		)
	end,
})
