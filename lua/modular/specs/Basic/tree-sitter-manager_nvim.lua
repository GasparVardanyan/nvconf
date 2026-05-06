return {
	"romus204/tree-sitter-manager.nvim",
	config = function ()
		require("tree-sitter-manager").setup({
			ensure_installed = require ("modular.config.treesitters"),
			languages = require ("modular.config.treesitters_custom"),
		})
	end,
}
