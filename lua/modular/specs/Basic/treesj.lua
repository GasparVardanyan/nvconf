return {
	'Wansmer/treesj',
	-- keys = { '<space>m', '<space>j', '<space>s' },
	dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
	opts = {},
	config = function(opts)
		-- require('treesj').setup({--[[ your config ]]})
		require ("treesj.settings")._update_settings (opts)
		require ("treesj.settings")._create_commands ()
		-- require ("treesj.settings")._set_default_keymaps () -- NOTE: DONT DO THIS BY DEFAULT !!!
	end,
}
