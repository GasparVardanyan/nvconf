local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local NoneLSModule = Module:new ({
	name = "NoneLS",
	plugins = {
		require ("modular.specs.NoneLS.none-ls_nvim"),
		require ("modular.specs.NoneLS.diactions_nvim"),
	},
	actions = {
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = { "none-ls.nvim", "diactions.nvim" },
			action = function ()
				local NoneLSAdapters = require ("modular.config.nonels_adapters")
				vim.list_extend (NoneLSAdapters, {
					-- function ()
					-- 	return require ("null-ls").builtins.diagnostics.gccdiag
					-- end,
					function ()
						return require ("diactions.none-ls")
					end,
				})
			end
		}),
	},
})

return NoneLSModule
