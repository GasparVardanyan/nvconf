local groups = require ("modular.autogroups")

local function save_session ()
	vim.cmd [[
		if filereadable(".vim.session")
			mksession! .vim.session
		endif
	]]
end

local function restore_session ()
	vim.cmd [[
		%bd!
		if filereadable("CMakeLists.txt")
			execute 'CMakeSelectCwd ' . fnameescape (getcwd ())
			CMakeStopExecutor
			execute 'CMakeSelectBuildDir ' . fnameescape (getcwd ()) . '/out'
			" call system ('ln -s out/compile_commands.json .')
			LspRestart
		endif
		if filereadable(".vim.session")
			silent source .vim.session
			doautoall BufRead
			" bufdo UfoAttach
		endif
		if filereadable(".nvim.lua")
			source .nvim.lua
		elseif filereadable(".exrc")
			source .exrc
		endif
	]]
end

vim.api.nvim_create_autocmd ("BufReadPost", {
	group = vim.api.nvim_create_augroup (groups.NvimBufReadReturnToLastPos, { clear = true }),
	callback = function ()
		local last_line = vim.fn.line ("'\"")
		if last_line > 0 and last_line <= vim.fn.line ("$") then
			vim.cmd [[normal! g`"zvzz]]
		end
	end,
})

vim.api.nvim_create_autocmd ("ExitPre", {
	group = vim.api.nvim_create_augroup (groups.NvimExitPre, { clear = true }),
	callback = save_session,
})

vim.api.nvim_create_autocmd ("DirChangedPre", {
	group = vim.api.nvim_create_augroup (groups.NvimDirChangedPre, { clear = true }),
	callback = save_session,
})

vim.api.nvim_create_autocmd ("DirChanged", {
	group = vim.api.nvim_create_augroup (groups.NvimDirChanged, { clear = true }),
	callback = restore_session
})
