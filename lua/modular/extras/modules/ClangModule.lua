local Module = require ("modular.Module")
local PostPluginLoadAction = require ("modular.PostPluginLoadAction")

local ClangModule = Module:new ({
	name = "Clang",
	plugins = {
		{
			"GasparVardanyan/cppman.nvim",
			dependencies = {
				"MunifTanjim/nui.nvim"
			},
			config = true,
		},
		{
			"https://git.sr.ht/~p00f/clangd_extensions.nvim",
			config = true,
		},
	},
	post_plugin_load_actions = {
		PostPluginLoadAction:new ({
			plugins = "cppman.nvim",
			action = function ()
				local map = vim.keymap.set

				local cppman = require ("cppman")
				-- TODO: implement a cplusplus/cppreference switch

				map ("n", "<leader>Cm", function()
					cppman.open_cppman_for(vim.fn.expand("<cWORD>"))
				end, {
					desc = "cppman <cWORD>"
				})

				map ("n", "<leader>Cc", function()
					cppman.input()
				end, {
					desc = "cppman"
				})
			end
		}),
		PostPluginLoadAction:new ({
			plugins = { "cppman.nvim", "which-key.nvim" },
			action = function ()
				local wk = require("which-key")
				wk.add({
					{ "<leader>C", group = "Clang" },
				})
			end
		}),
	}
})

return ClangModule
