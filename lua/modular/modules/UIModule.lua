local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local UIModule = Module:new ({
	name = "UI",
	priority = 1000,
	plugins = {
		require ("modular.specs.UI.NeoSolarized_nvim"),
		-- require ("modular.specs.UI.NeoSolarized"),
		-- require ("modular.specs.UI.selenized_nvim"),
		require ("modular.specs.UI.solarized-osaka_nvim"),
		-- require ("modular.specs.UI.solarized_nvim1"),
		require ("modular.specs.UI.solarized_nvim2"),
		require ("modular.specs.UI.kanagawa_nvim"),
		require ("modular.specs.UI.kanagawa-paper_nvim"),
	},
	actions = {
		-- ModuleAction:new ({
		-- 	plugins = "NeoSolarized.nvim",
		-- 	action = function ()
		-- 		vim.opt.background = "dark"
		-- 		vim.cmd.colorscheme "NeoSolarized"
		-- 	end
		-- }),
		-- ModuleAction:new ({
		-- 	plugins = "solarized-osaka.nvim",
		-- 	action = function ()
		-- 		vim.opt.background = "dark"
		-- 		vim.cmd.colorscheme "solarized-osaka"
		-- 	end
		-- }),
		ModuleAction:new ({
			plugins = "kanagawa.nvim",
			action = function ()
				vim.opt.background = "dark"
				vim.cmd.colorscheme "kanagawa-wave"
			end
		}),
	}
})

-- https://github.com/Tsuzat/NeoSolarized.nvim
-- https://github.com/overcache/NeoSolarized
-- https://github.com/maxmx03/solarized.nvim
-- https://github.com/shaunsingh/solarized.nvim
-- https://github.com/altercation/vim-colors-solarized
-- https://github.com/calind/selenized.nvim
-- https://github.com/craftzdog/solarized-osaka.nvim
-- https://github.com/ishan9299/nvim-solarized-lua
-- https://github.com/jan-warchol/selenized
-- https://github.com/lifepillar/vim-solarized8
-- https://github.com/loganswartz/selenized.nvim
-- https://github.com/romainl/flattened
-- https://github.com/shaunsingh/solarized.nvim
-- https://github.com/svrana/neosolarized.nvim

return UIModule
