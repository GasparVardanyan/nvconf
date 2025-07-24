local nproc = tonumber (vim.fn.system ({"nproc"}))
local cmake_build_options = {}

if 0 ~= nproc
then
	vim.list_extend (cmake_build_options, { "-j" .. nproc })
end

return {
	"Civitasv/cmake-tools.nvim",
	config = function ()
		require ("cmake-tools").setup {
			cmake_build_options = cmake_build_options
		}
	end,
}
