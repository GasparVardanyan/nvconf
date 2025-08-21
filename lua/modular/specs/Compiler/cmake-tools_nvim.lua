return {
	"Civitasv/cmake-tools.nvim",
	config = function ()
		local nproc = tonumber (vim.fn.system ({"nproc"}))
		local cmake_build_options = {}
		local cmake_generate_options = {}

		if 0 ~= nproc
		then
			vim.list_extend (cmake_build_options, { "-j" .. (nproc - 1) })
		end

		if 1 == vim.fn.filereadable ("/usr/bin/clang") and 1 == vim.fn.filereadable ("/usr/bin/clang++")
		then
			vim.fn.setenv ("CC", "/usr/bin/clang")
			vim.fn.setenv ("CXX", "/usr/bin/clang++")
		end

		if 1 == vim.fn.filereadable ("/usr/bin/ccache")
		then
			vim.fn.setenv ("CMAKE_C_COMPILER_LAUNCHER", "ccache")
			vim.fn.setenv ("CMAKE_CXX_COMPILER_LAUNCHER", "ccache")
		end

		if 1 == vim.fn.filereadable ("/usr/bin/ninja")
		then
			vim.list_extend (cmake_generate_options, { "-G Ninja" })
		end

		require ("cmake-tools").setup {
			cmake_build_options = cmake_build_options,
			cmake_generate_options = cmake_generate_options,
		}
	end,
}
