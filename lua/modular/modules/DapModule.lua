local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local DapModule = Module:new ({
	name = "Dap",
	plugins = {
		require ("modular.specs.Misc.mason_nvim"),
		require ("modular.specs.Dap.nvim-dap"),
		require ("modular.specs.Dap.mason-nvim-dap"),
		require ("modular.specs.Dap.nvim-dap-ui"),
		require ("modular.specs.Dap.nvim-dap-image"),
		require ("modular.specs.Dap.telescope-dap_nvim"),
	},
	actions = {
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = "nvim-dap",
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>d",  "dap")
				reg_mapping_group ("<leader>ds",  "step")
			end
		}),
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = "nvim-dap-image",
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>di",  "image")
			end
		}),
		ModuleAction:new ({
			plugins = "nvim-dap",
			action = function ()
				require ("modular.mappings.Dap.nvim-dap")
			end
		}),
		ModuleAction:new ({
			plugins = "nvim-dap-image",
			action = function ()
				require ("modular.mappings.Dap.nvim-dap-image")
			end
		}),
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = { "telescope-dap.nvim", "telescope.nvim" },
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>df",  "fuzzy")
			end
		}),
		ModuleAction:new ({
			plugins = { "nvim-dap", "telescope-dap.nvim", "telescope.nvim" },
			action = function ()
				require ("modular.mappings.Dap.telescope-dap_telescope_nvim")
			end
		}),
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = { "nvim-dap", "fzf-lua" },
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>df",  "fuzzy")
			end
		}),
		-- NOTE: load fzf-lua mappings after telescope ones to override
		ModuleAction:new ({
			plugins = { "nvim-dap", "fzf-lua" },
			action = function ()
				require ("modular.mappings.Dap.nvim-dap_fzf-lua")
			end
		}),
	}
})

return DapModule
