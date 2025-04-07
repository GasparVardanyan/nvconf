return {
	"otavioschwanck/arrow.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	opts = {
		show_icons = true,
		-- TODO: This is not the place to set mappings !!!
		leader_key = '<leader><space>', -- Recommended to be a single key
		buffer_leader_key = '<leader>B', -- Per Buffer Mappings
	}
}
