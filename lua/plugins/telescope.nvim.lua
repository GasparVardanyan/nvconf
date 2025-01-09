return {
	"nvim-telescope/telescope.nvim",
	lazy = true,
	dependencies = { "nvim-lua/plenary.nvim", "LukasPietzschmann/telescope-tabs" },
	config = function()
		require('telescope-tabs').setup ()
		require('telescope').load_extension 'telescope-tabs'
	end,
}
