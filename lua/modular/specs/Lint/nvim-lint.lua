return {
	"mfussenegger/nvim-lint",
	config = function ()
		require ("lint").linters_by_ft = require ("modular.config.linters_by_ft")
	end,
}
