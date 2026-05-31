return {
	"tinted-theming/tinted-nvim",
	priority = 1000,
	lazy = false,
	config = true,
	opts = {
		default_scheme = "base16-solarized-dark", -- pick any bundled Base16/Base24
		compile = true, -- optional: precompile for faster startup
		apply_scheme_on_startup = false,
	},
}
