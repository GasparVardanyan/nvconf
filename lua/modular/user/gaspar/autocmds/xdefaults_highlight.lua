local groups = require ("modular.user.gaspar.autogroups")

vim.api.nvim_create_autocmd ({"BufNewFile", "BufReadPost"}, {
	group = vim.api.nvim_create_augroup (groups.ExtraXdefaultsFiles, { clear = true }),
	pattern = {
		  "*.xdefaults"
		, "*.palette"
	},
	callback = function ()
		vim.api.nvim_set_option_value ("syntax", "xdefaults", {})
	end,
})

