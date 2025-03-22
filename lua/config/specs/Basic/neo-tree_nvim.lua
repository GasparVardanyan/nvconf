return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim",
		{
			's1n7ax/nvim-window-picker',
			name = 'window-picker',
			event = 'VeryLazy',
			version = '2.*',
			config = function()
				require'window-picker'.setup({
					hint = 'floating-big-letter',
				})
			end,
		}
	},
	lazy = false, -- neo-tree will lazily load itself
	---@module "neo-tree"
	---@type neotree.Config?
	opts = {
		-- fill any relevant options here
	},
}
