return {
	"mfussenegger/nvim-lint",
	config = function ()
		require ("lint").linters_by_ft = {
			cpp = {"clangtidy", "cppcheck"},
			c = {"clangtidy", "cppcheck"},
		}
	end,
}
