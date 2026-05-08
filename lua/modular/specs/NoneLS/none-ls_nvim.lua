return {
	"nvimtools/none-ls.nvim",
	config = function ()
		local adapters = require("modular.config.nonels_adapters")

		local sources = {}

		for _, make_source in ipairs (adapters) do
			table.insert (sources, make_source ())
		end

		require("null-ls").setup ({
			sources = sources,
		})
	end
}
