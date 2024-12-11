vim.api.nvim_create_autocmd("FileType", {
	pattern = "hlsplaylist",
	callback = function(args)
		vim.cmd [[
			function GetM3UHeader()
				norm O#EXTINF:,j0f=lvg_"*yk
				read !mediainfo --Output='General;\%Track\%' -- "$(xsel -op)".*
				norm kJxjj
			endfunction
			function GetM3UHeaderOPUS()
				norm O#EXTINF:,j0f=lvg_"*yk
				read !mediainfo --Output='General;\%Track\%' -- "$(xsel -op)".opus
				norm kJxjj
			endfunction
			function GetM3UHeaderM4A()
				norm O#EXTINF:,j0f=lvg_"*yk
				read !mediainfo --Output='General;\%Track\%' -- "$(xsel -op)".m4a
				norm kJxjj
			endfunction
			function GetM3UHeaderMKV()
				norm O#EXTINF:,j0f=lvg_"*yk
				read !mediainfo --Output='General;\%Movie\%' -- "$(xsel -op)".mkv
				norm kJxjj
			endfunction
			function GetM3UHeaderMP4()
				norm O#EXTINF:,j0f=lvg_"*yk
				read !mediainfo --Output='General;\%Movie\%' -- "$(xsel -op)".mp4
				norm kJxjj
			endfunction
		]]
	end
})
