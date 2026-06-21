local cmake = require ("cmake-tools")

vim.api.nvim_create_user_command ("CMakeRunPerf", function ()
	cmake.run ({ wrap_call = { "perf", "record", "--call-graph", "dwarf" } })
end, {})

vim.api.nvim_create_user_command ("CMakeRunValgrind", function ()
	cmake.run ({ wrap_call = { "valgrind", "--leak-check=full", "--xml=yes", "--xml-file=valgrind.xml" } })
end, {})

vim.api.nvim_create_user_command ("CMakeRunPerfCurrent", function ()
	cmake.run_current_file ({ wrap_call = { "perf", "record", "--call-graph", "dwarf" } })
end, {})

vim.api.nvim_create_user_command ("CMakeRunValgrindCurrent", function ()
	cmake.run_current_file ({ wrap_call = { "valgrind", "--leak-check=full", "--xml=yes", "--xml-file=valgrind.xml"  } })
end, {})
