local Module = require ("modular.Module")

-- TODO: refactor these specs and move to the appropriate location
local TemporaryModule2 = Module:new ({
	name = "Temporary2",
	plugins = {
		{
			'MeanderingProgrammer/render-markdown.nvim',
			dependencies = {
				'nvim-treesitter/nvim-treesitter',
				'nvim-tree/nvim-web-devicons',
				'latex-lsp/tree-sitter-latex',
				'tree-sitter-grammars/tree-sitter-markdown',
				'tree-sitter/tree-sitter-html'
			},
			---@module 'render-markdown'
			---@type render.md.UserConfig
			opts = {},
		}
	}
})

return TemporaryModule2
