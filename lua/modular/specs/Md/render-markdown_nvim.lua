return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"tree-sitter-grammars/tree-sitter-markdown",
		"nvim-tree/nvim-web-devicons",

		-- TODO: Refactor these:
		"latex-lsp/tree-sitter-latex",
		"tree-sitter/tree-sitter-html"
	},
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {},
}
