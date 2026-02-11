return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	lazy = true,
	branch = "master",
	config = function ()
		require ("nvim-treesitter.configs").setup (
			-- FIXME: doesn't work
			require ("modular.config.textobjects")
		)
	end,
}
