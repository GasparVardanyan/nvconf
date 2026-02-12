return {
	"NvChad/base46",
	lazy = false,
	priority = 1000,
	opts = {
		theme = "solarized_dark",
	},
	init = function()
		vim.g.base46_cache = vim.fn.stdpath("cache") .. "/base46"

		package.loaded["nvconfig"] = {
			base46 = {
				theme = "onedark", -- default theme
				hl_add = {},
				hl_override = {},
				integrations = {},
				changed_themes = {},
				transparency = false,
				theme_toggle = { "onedark", "one_light" },
			},

			ui = {
				cmp = {
					icons_left = false, -- only for non-atom styles!
					style = "default", -- default/flat_light/flat_dark/atom/atom_colored
					abbr_maxwidth = 60,
					-- for tailwind, css lsp etc
					format_colors = { lsp = true, icon = "󱓻" },
				},

				telescope = { style = "borderless" }, -- borderless / bordered

				statusline = {
					enabled = true,
					theme = "default", -- default/vscode/vscode_colored/minimal
					-- default/round/block/arrow separators work only for default statusline theme
					-- round and block will work for minimal theme only
					separator_style = "default",
					order = nil,
					modules = nil,
				},

				-- lazyload it when there are 1+ buffers
				tabufline = {
					enabled = true,
					lazyload = true,
					treeOffsetFt = "NvimTree",
					order = { "treeOffset", "buffers", "tabs", "btns" },
					modules = nil,
					bufwidth = 21,
				},
			},

			nvdash = {
				load_on_startup = false,
				header = {
					"                      ",
					"  ▄▄         ▄ ▄▄▄▄▄▄▄",
					"▄▀███▄     ▄██ █████▀ ",
					"██▄▀███▄   ███        ",
					"███  ▀███▄ ███        ",
					"███    ▀██ ███        ",
					"███      ▀ ███        ",
					"▀██ █████▄▀█▀▄██████▄ ",
					"  ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀",
					"                      ",
					"  Powered By  eovim ",
					"                      ",
				},

				buttons = {
					{ txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
					{ txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
					{ txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
					{ txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
					{ txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },

					{ txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

					{
						txt = function()
							local stats = require("lazy").stats()
							local ms = math.floor(stats.startuptime) .. " ms"
							return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
						end,
						hl = "NvDashFooter",
						no_gap = true,
						content = "fit",
					},

					{ txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
				},
			},

			term = {
				startinsert = true,
				base46_colors = true,
				winopts = { number = false, relativenumber = false },
				sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
				float = {
					relative = "editor",
					row = 0.3,
					col = 0.25,
					width = 0.5,
					height = 0.4,
					border = "single",
				},
			},

			lsp = { signature = true },

			cheatsheet = {
				theme = "grid", -- simple/grid
				excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
			},

			mason = { pkgs = {}, skip = {} },

			colorify = {
				enabled = true,
				mode = "virtual", -- fg, bg, virtual
				virt_text = "󱓻 ",
				highlight = { hex = true, lspvars = true },
			},
		}
	end,
	config = function(_, opts)
		local nvconfig = require("nvconfig")
		nvconfig.base46 = vim.tbl_deep_extend("force", nvconfig.base46, opts)

		vim.fn.mkdir(vim.g.base46_cache, "p")

		require("base46").load_all_highlights()

		vim.api.nvim_create_user_command("Base46Theme", function(input)
			nvconfig.base46.theme = input.args
			require("base46").load_all_highlights()
		end, { nargs = 1, desc = "Switch base46 theme" })
	end,
}
