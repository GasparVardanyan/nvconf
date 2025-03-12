return {
	'MagicDuck/grug-far.nvim',
	lazy = true,
	config = function()
		require('grug-far').setup({
			engine = "rg"
		});
	end
}
