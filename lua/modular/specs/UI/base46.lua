return {
	"NvChad/base46",
	dependencies = {
		"NvChad/ui"
	},
	lazy = false,
	priority = 1000,
	init = function ()
		vim.g.base46_cache = vim.fn.stdpath ("cache") .. "/base46"
	end,
	config = function (_, opts)
		local nvconfig = require ("nvconfig")
		nvconfig.base46 = vim.tbl_deep_extend ("force", nvconfig.base46, opts)

		vim.fn.mkdir (vim.g.base46_cache, "p")

		require ("base46").load_all_highlights ()
	end,
}
