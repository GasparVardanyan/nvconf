return {
	"nvimtools/none-ls.nvim",
	lazy = true,
	config = function()
		local null_ls = require('null-ls')
		null_ls.setup ({
		})
	end,
}
