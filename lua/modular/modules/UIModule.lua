local Module = require ("modular.Module")
local PostPluginLoadAction = require ("modular.PostPluginLoadAction")

local UIModule = Module:new ({
	name = "UI",
	priority = 1000,
	plugins = {
		require ("modular.specs.UI.NeoSolarized_nvim"),
		-- require ("modular.specs.UI.selenized_nvim"),
		require ("modular.specs.UI.solarized-osaka_nvim"),
		-- require ("modular.specs.UI.solarized_nvim1"),
		require ("modular.specs.UI.solarized_nvim2"),
		require ("modular.specs.UI.kanagawa_nvim"),
		require ("modular.specs.UI.kanagawa-paper_nvim"),
	},
	post_plugin_load_actions = {
		-- PostPluginLoadAction:new ({
		-- 	plugins = "NeoSolarized.nvim",
		-- 	action = function ()
		-- 		vim.opt.background = "dark"
		-- 		vim.cmd.colorscheme "NeoSolarized"
		-- 	end
		-- }),
		-- PostPluginLoadAction:new ({
		-- 	plugins = "solarized-osaka.nvim",
		-- 	action = function ()
		-- 		vim.opt.background = "dark"
		-- 		vim.cmd.colorscheme "solarized-osaka"
		-- 	end
		-- }),
		PostPluginLoadAction:new ({
			plugins = "kanagawa.nvim",
			action = function ()
				vim.opt.background = "dark"
				vim.cmd.colorscheme "kanagawa-wave"
			end
		}),
	}
})

return UIModule
