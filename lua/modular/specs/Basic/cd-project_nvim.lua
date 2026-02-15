-- using lazy.nvim
return {
	"LintaoAmons/cd-project.nvim",
	-- Don't need call the setup function if you think you are good with the default configuration
	-- tag = "v0.6.1", -- Optional, You can also use tag to pin the plugin version for stability
	init = function() -- use init if you want enable auto_register_project, otherwise config is good
		require("cd-project").setup({
			-- this json file is acting like a database to update and read the projects in real time.
			-- So because it's just a json file, you can edit directly to add more paths you want manually
			projects_config_filepath = vim.fs.normalize(vim.fn.stdpath("config") .. "/cd-project.nvim.json"),
			-- this controls the behaviour of `CdProjectAdd` command about how to get the project directory
			project_dir_pattern = { ".git", ".gitignore", "compile_commands.json", "Makefile", "init.lua" },
			choice_format = "both", -- optional, you can switch to "name" or "path"
			projects_picker = "vim-ui", -- optional, you can switch to `telescope`
			auto_register_project = false, -- optional, toggle on/off the auto add project behaviour
			remember_project_position = false,
			-- do whatever you like by hooks
			hooks = {
				-- Run before cd to project, add a bookmark here, then can use `CdProjectBack` to switch back
				{
					trigger_point = "BEFORE_CD",
					callback = function(_)
						-- require("bookmarks").api.mark({name = "before cd project"})
						vim.cmd [[
							if filereadable(".vim.session")
								mksession! .vim.session
							endif
							%bd!
						]]
					end,
				},
				-- Run after cd to project, find and open a file in the target project by smart-open
				{
					trigger_point = "AFTER_CD",
					callback = function(_)
						vim.cmd [[
							if filereadable("CMakeLists.txt")
								execute 'CMakeSelectCwd ' . fnameescape (getcwd ())
								CMakeStopExecutor
								execute 'CMakeSelectBuildDir ' . fnameescape (getcwd ()) . '/out'
								call system ('ln -s out/compile_commands.json .')
								LspRestart
							endif
							if filereadable(".vim.session")
								source .vim.session
							endif
							if filereadable(".exrc")
								source .exrc
							endif
						]]
						-- NOTE: not complete logic
						-- local bufinfos = vim.fn.getbufinfo({buflisted = 1})
						-- vim.tbl_map(function (bufinfo)
						-- 	if bufinfo.changed == 0 and (bufinfo.name == '' or vim.bo [bufinfo.bufnr].buftype == "nofile" or (vim.bo [bufinfo.bufnr].filetype == "" and bufinfo.listed == 1)) then
						-- 		vim.print ("RM " .. vim.api.nvim_buf_get_name(bufinfo.bufnr))
						-- 		print (vim.bo [bufinfo.bufnr].filetype)
						-- 		print (vim.bo [bufinfo.bufnr].buftype)
						-- 		vim.api.nvim_buf_delete(bufinfo.bufnr, {force = false, unload = false})
						-- 	end
						-- end, bufinfos)
					end,
				},
			}
		})
	end,
	config=true
}
