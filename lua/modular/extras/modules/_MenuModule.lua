local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local MenuModule = Module:new ({
	name = "Menu",
	plugins = {
		require ("modular.extras.specs.Menu.menu"),
		require ("modular.extras.specs.Menu.volt"),
	},
	actions = {
		ModuleAction:new ({
			plugins = "menu",
			action = function ()
				-- Keyboard users
				vim.keymap.set("n", "<C-t>", function()
					require("menu").open("default")
				end, {})

				-- mouse users + nvimtree users!
				vim.keymap.set({ "n", "v" }, "<RightMouse>", function()
					require('menu.utils').delete_old_menus()

					vim.cmd.exec '"normal! \\<RightMouse>"'

					-- clicked buf
					local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
					local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

					require("menu").open(options, { mouse = true })
				end, {})
			end
		})
	}
})

return MenuModule
