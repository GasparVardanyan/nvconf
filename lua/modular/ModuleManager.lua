local ModuleLoadTracker = require ("modular.ModuleLoadTracker")
local ModuleAction = require ("modular.ModuleAction")

local ModuleManager = {}
ModuleManager.__index = ModuleManager

function ModuleManager:new (opts)
	local obj = setmetatable ({}, ModuleManager)

	obj.actions = {}
	obj.__loaded_plugins = {}

	obj.modules = opts.modules or {}

	if true == opts.load_tracker then
		obj.module_load_tracker = ModuleLoadTracker:new (obj)
	end

	local plugins = {}
	local pre_actions = {}

	-- TODO: handle the same plugin appearance in multiple modules
	for _, module in pairs (obj.modules) do
		vim.list_extend (plugins, module.plugins)

		for _, action in ipairs (module.actions) do
			if ModuleAction.EventType.Post == action.event then
				table.insert (obj.actions, action)
			elseif ModuleAction.EventType.Pre == action.event then
				table.insert (pre_actions, action)
			end
		end



		for _, spec in ipairs (module.plugins) do
			spec.priority = spec.priority or module.priority
			local plugin_name = spec [1]:match (".*/(.*)")
			obj.__loaded_plugins [plugin_name] = false
		end
	end

	local plugin_names = vim.tbl_keys (obj.__loaded_plugins)

	for i = #pre_actions, 1, -1 do
		local dependenciesSatisfied = true

		for _, pname in ipairs (pre_actions [i].plugins) do
			if not vim.list_contains (plugin_names, pname) then
				dependenciesSatisfied = false
				break
			end
		end

		if true == dependenciesSatisfied then
			pre_actions [i].action ()
			table.remove (pre_actions, i)
		end
	end

	obj.lazy_load_handler = vim.api.nvim_create_autocmd ("User", {
		pattern = "LazyLoad",
		callback = function (data)
			obj:mark_plugin_loaded (data.data)
		end,
	})

	require("lazy").setup(plugins)

	return obj
end

function ModuleManager:mark_plugin_loaded (plugin)
	-- for p, _ in pairs (self.__loaded_plugins) do
	-- if p == plugin then

	-- NOTE: we assume the only place we load plugins is here...
	if false == self.__loaded_plugins [plugin] then
		self.__loaded_plugins [plugin] = true

		for i = #self.actions, 1, -1 do
			local loaded = true
			for _, pname in ipairs (self.actions [i].plugins) do
				if not self.__loaded_plugins [pname] then
					loaded = false
					break
				end
			end
			if true == loaded then
				self.actions [i].action ()
				table.remove (self.actions, i)
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
