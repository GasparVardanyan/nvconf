local ModuleManager = {}
ModuleManager.__index = ModuleManager

function ModuleManager:new ()
	local obj = setmetatable ({}, ModuleManager)

	obj.modules = {
		ui_module = require ("config.UIModule"),
		basic_module = require ("config.BasicModule"),
		git_module = require ("config.GitModule"),
		org_module = require ("config.OrgModule"),
	}

	local all_plugins = {}

	for module, _ in ipairs (obj.modules) do
		vim.list_extend(all_plugins, module.plugins)

		vim.api.nvim_create_autocmd ("User", {
			pattern = module.ready_autocmd_pattern,
			callback = function ()
				print (module.ready_autocmd_pattern .. " - Module Loaded")
			end,
		})
	end

	vim.api.nvim_create_autocmd ("User", {
		pattern = "ModuleUIReady",
		callback = function()
			vim.cmd [[ set background=dark ]]
			vim.cmd [[ color NeoSolarized ]]
		end,
	})

	require("lazy").setup(all_plugins)

	return obj
end

return ModuleManager
