return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim",
		"s1n7ax/nvim-window-picker",
	},
	lazy = false, -- neo-tree will lazily load itself

	config = function ()
		require("neo-tree").setup({
			filesystem = {
				hijack_netrw_behavior = "disabled",
				use_libuv_file_watcher = true,
			},
			buffers = {
				show_unloaded = true,
			},
			document_symbols = {
				follow_cursor = true,
			},
			sources = {
				"buffers",
				"document_symbols",
				"filesystem",
				"git_status",
			}
		})
	end
}
