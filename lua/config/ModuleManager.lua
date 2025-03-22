local ModuleLoadTracker = require ("config.ModuleLoadTracker")

local ModuleManager = {}
ModuleManager.__index = ModuleManager

function ModuleManager:new ()
	local obj = setmetatable ({}, ModuleManager)

	obj.post_plugin_load_actions = {}
	obj.__loaded_plugins = {}

	obj.modules = {
		ui_module = require ("config.modules.UIModule"),
		basic_module = require ("config.modules.BasicModule"),
		git_module = require ("config.modules.GitModule"),
		nvim_module = require ("config.modules.NvimModule"),
		org_module = require ("config.modules.OrgModule"),
		compiler_module = require ("config.modules.CompilerModule"),
		dap_module = require ("config.modules.DapModule"),
		db_module = require ("config.modules.DbModule"),
		temporary_module1 = require ("config.modules.TemporaryModule1"),
		-- lspsaga_module = require ("config.modules.LspModule")
	}

	obj.module_load_tracker = ModuleLoadTracker:new (obj)

	local all_plugins = {}

	-- TODO: handle the same plugin appearance in multiple modules
	for _, module in pairs (obj.modules) do
		vim.list_extend (all_plugins, module.plugins)
		vim.list_extend (obj.post_plugin_load_actions, module.post_plugin_load_actions)

		for _, spec in ipairs (module.plugins) do
			spec.priority = spec.priority or module.priority
			local plugin_name = spec [1]:match (".*/(.*)")
			obj.__loaded_plugins [plugin_name] = false
		end
	end

	obj.lazy_load_handler = vim.api.nvim_create_autocmd ("User", {
		pattern = "LazyLoad",
		callback = function (data)
			obj:mark_plugin_loaded (data.data)
		end,
	})

	require("lazy").setup(all_plugins)

	return obj
end

function ModuleManager:mark_plugin_loaded (plugin)
	-- for p, _ in pairs (self.__loaded_plugins) do
	-- if p == plugin then

	-- NOTE: we assume the only place we load plugins is here...
	if false == self.__loaded_plugins [plugin] then
		self.__loaded_plugins [plugin] = true

		for i = #self.post_plugin_load_actions, 1, -1 do
			local loaded = true
			for _, pname in ipairs (self.post_plugin_load_actions [i].plugins) do
				if not self.__loaded_plugins [pname] then
					loaded = false
					break
				end
			end
			if true == loaded then
				self.post_plugin_load_actions [i].action ()
				table.remove (self.post_plugin_load_actions, i)
			end
		end
	else
		return
	end

		--			break
		--		end
		--	end
end


return ModuleManager
