local Module = require ("config.Module")

local UIModule = Module:new ({
	name = "UI",
	priority = 1000,
	plugins = {
		require ("config.specs.UI.NeoSolarized_nvim"),
		require ("config.specs.UI.solarized_nvim"),
		require ("config.specs.UI.solarized-osaka_nvim"),
	}
})

return UIModule
