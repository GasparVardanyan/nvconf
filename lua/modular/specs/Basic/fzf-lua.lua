return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope.nvim", -- NOTE: make fzf-lua load after telescope
											-- to override telescope mappings
	},
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "nvim-mini/mini.icons" },
	---@module "fzf-lua"
	---@type fzf-lua.Config|{}
	---@diagnostic disable: missing-fields
	opts = {
		"telescope",
		files = {
			fd_opts = [[--color=never --hidden --type f --type l --exclude .git --no-ignore-vcs]],
		},
		ui_select = true,
		winopts = {
			fullscreen = true,
		},
	}
	---@diagnostic enable: missing-fields

	-- NOTE:
	-- FzfLua undotree previewer=undotree_native
}
