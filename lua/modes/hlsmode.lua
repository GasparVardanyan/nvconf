vim.cmd [[
	function s:GetM3UHeader()
		norm O#EXTINF:,j0f=lvg_"*yk
		read !mediainfo --Output='General;\%Track\%' -- "$(xsel -op)".*
		norm kgJjj
	endfunction
	function s:GetM3UHeaderOPUS()
		norm O#EXTINF:,j0f=lvg_"*yk
		read !mediainfo --Output='General;\%Track\%' -- "$(xsel -op)".opus
		norm kgJjj
	endfunction
	function s:GetM3UHeaderM4A()
		norm O#EXTINF:,j0f=lvg_"*yk
		read !mediainfo --Output='General;\%Track\%' -- "$(xsel -op)".m4a
		norm kgJjj
	endfunction
	function s:GetM3UHeaderMKV()
		norm O#EXTINF:,j0f=lvg_"*yk
		read !mediainfo --Output='General;\%Movie\%' -- "$(xsel -op)".mkv
		norm kgJjj
	endfunction
	function s:GetM3UHeaderMP4()
		norm O#EXTINF:,j0f=lvg_"*yk
		read !mediainfo --Output='General;\%Movie\%' -- "$(xsel -op)".mp4
		norm kgJjj
	endfunction

	command -buffer GetM3UHeader call <SID>GetM3UHeader()
	command -buffer GetM3UHeaderOPUS call <SID>GetM3UHeaderOPUS()
	command -buffer GetM3UHeaderM4A call <SID>GetM3UHeaderM4A()
	command -buffer GetM3UHeaderMKV call <SID>GetM3UHeaderMKV()
	command -buffer GetM3UHeaderMP4 call <SID>GetM3UHeaderMP4()
]]
