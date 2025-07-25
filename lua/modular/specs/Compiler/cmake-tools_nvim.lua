return {
	"Civitasv/cmake-tools.nvim",
	config = function ()
		local nproc = tonumber (vim.fn.system ({"nproc"}))
		local cmake_build_options = {}

		if 0 ~= nproc
		then
			vim.list_extend (cmake_build_options, { "-j" .. (nproc - 1) })
		end

		if vim.fn.filereadable ("/usr/bin/clang") and vim.fn.filereadable ("/usr/bin/clang++")
		then
			vim.fn.setenv ("CC", "/usr/bin/clang")
			vim.fn.setenv ("CXX", "/usr/bin/clang++")
		end

		if vim.fn.filereadable ("/usr/bin/ccache")
		then
			vim.fn.setenv ("CMAKE_C_COMPILER_LAUNCHER", "ccache")
			vim.fn.setenv ("CMAKE_CXX_COMPILER_LAUNCHER", "ccache")
		end

		require ("cmake-tools").setup {
			cmake_build_options = cmake_build_options
		}
	end,
}
