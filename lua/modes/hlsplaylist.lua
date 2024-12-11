vim.api.nvim_create_autocmd("FileType", {
	pattern = "hlsplaylist",
	callback = function(args)
		vim.cmd [[
			function GetM3UHeader()
				norm O#EXTINF:,j0f=lvg_"*yk
				read !mediainfo --Output='General;\%Track\%' -- "$(xsel -op)".*
				norm kgJjj
			endfunction
			function GetM3UHeaderOPUS()
				norm O#EXTINF:,j0f=lvg_"*yk
				read !mediainfo --Output='General;\%Track\%' -- "$(xsel -op)".opus
				norm kgJjj
			endfunction
			function GetM3UHeaderM4A()
				norm O#EXTINF:,j0f=lvg_"*yk
				read !mediainfo --Output='General;\%Track\%' -- "$(xsel -op)".m4a
				norm kgJjj
			endfunction
			function GetM3UHeaderMKV()
				norm O#EXTINF:,j0f=lvg_"*yk
				read !mediainfo --Output='General;\%Movie\%' -- "$(xsel -op)".mkv
				norm kgJjj
			endfunction
			function GetM3UHeaderMP4()
				norm O#EXTINF:,j0f=lvg_"*yk
				read !mediainfo --Output='General;\%Movie\%' -- "$(xsel -op)".mp4
				norm kgJjj
			endfunction
		]]
	end
})
