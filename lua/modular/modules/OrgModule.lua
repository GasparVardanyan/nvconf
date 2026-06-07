local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local OrgModule = Module:new ({
	name = "Org",
	plugins = {
		-- require ("modular.specs.Org.neorg"),
		require ("modular.specs.Org.orgmode"),
		-- require ("modular.specs.Misc.image_nvim"),
		-- require ("modular.specs.Misc.headlines_nvim"),
	},
	actions = {
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = "orgmode",
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>o",  "org")
			end
		}),
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = "neorg",
			action = function ()
				-- do return end
				local TreeSittersCustom = require ("modular.config.treesitters_custom")
				local TreeSitters = require ("modular.config.treesitters")
				-- TreeSittersCustom ["norg"] = {
				-- 	install_info = {
				-- 		url = "https://github.com/nvim-neorg/tree-sitter-norg",
				-- 		use_repo_queries = true,
				-- 	},
				-- }
				TreeSittersCustom ["norg_meta"] = {
					install_info = {
						url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
						use_repo_queries = true,
					},
				}
				vim.list_extend (TreeSitters, {
					-- "norg",
					"norg_meta",
				})
			end
		}),
		ModuleAction:new ({
			plugins = "neorg",
			action = function ()
				require ("modular.autocmds.Org.neorg")
				require ("modular.mappings.Org.neorg")
			end
		}),
		ModuleAction:new ({
			plugins = { "neorg", "vim-illuminate" },
			action = function ()
				require ("modular.autocmds.Org.neorg_noilluminate")
			end
		})
	}
})

return OrgModule
