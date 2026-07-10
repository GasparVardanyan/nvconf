return {
	"ranjithshegde/ccls.nvim",
	config = function ()
		require ("ccls").setup ({
			lsp = {
				server = {},
			},
		})
	end,
}
