return {
	'stevearc/oil.nvim',
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		columns = {
			-- "icon",
			-- "permissions",
			-- "size",
			-- "mtime",
		},
		keymaps = require ("modular.specmappings.Basic.oil_nvim"),
		watch_for_changes = true,
	},
	-- Optional dependencies
	-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
}
