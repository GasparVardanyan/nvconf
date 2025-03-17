local ModuleManager = {}
ModuleManager.__index = ModuleManager

function ModuleManager:new ()
	local obj = setmetatable ({}, ModuleManager)

	obj.modules = {
		ui_module = require ("config.modules.UIModule"),
		basic_module = require ("config.modules.BasicModule"),
		git_module = require ("config.modules.GitModule"),
		org_module = require ("config.modules.OrgModule"),
		compiler_module = require ("config.modules.CompilerModule"),
		temporary_module = require ("config.modules.TemporaryModule"),
	}

	local all_plugins = {}

	-- TODO: handle the same plugin appearance in multiple modules
	for _, module in pairs (obj.modules) do
		vim.list_extend (all_plugins, module.plugins)
	end

	vim.api.nvim_create_autocmd ("User", {
		pattern = "ModuleReady",
		callback = function (data)
			print (data.data .. " - Module Loaded\n")
		end,
	})

--	vim.api.nvim_create_autocmd ("User", {
--		pattern = "ModuleReady",
--		callback = function (data)
--			if obj.modules.ui_module.name == data.data then
--				vim.cmd [[ set background=dark ]]
--				vim.cmd [[ color NeoSolarized ]]
--			end
--		end,
--	})

	require("lazy").setup(all_plugins)

	return obj
end

return ModuleManager
