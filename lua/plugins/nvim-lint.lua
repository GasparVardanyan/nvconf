return {
	"mfussenegger/nvim-lint",
	lazy = true,
	config = function()
		require('lint').linters_by_ft = {
			cpp = {'cppcheck', 'clangtidy'},
		}
	end,
}
