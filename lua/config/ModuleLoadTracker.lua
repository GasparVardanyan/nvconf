local ModuleLoadTracker = {}
ModuleLoadTracker.__index = ModuleLoadTracker

function ModuleLoadTracker:new (module_manager)
	local obj = setmetatable ({}, ModuleLoadTracker)
	obj.module_manager = module_manager
	obj.__module_loaded_plugins = {}

	for _, module in pairs (module_manager.modules) do
		obj.__module_loaded_plugins [module.name] = {}

		for _, spec in ipairs (module.plugins) do
			local plugin_name = spec [1]:match (".*/(.*)")
			obj.__module_loaded_plugins [module.name] [plugin_name] = false
		end
	end

	obj.lazy_load_handler = vim.api.nvim_create_autocmd ("User", {
		pattern = "LazyLoad",
		callback = function (data)
			obj:mark_plugin_loaded (data.data)
		end,
	})
	return obj
end

function ModuleLoadTracker:mark_plugin_loaded (plugin)
	for _, module in pairs (self.module_manager.modules) do
		if false == module.ready then
			for p, v in pairs (self.__module_loaded_plugins [module.name]) do
				if false == v and p == plugin then
					self.__module_loaded_plugins [module.name] [plugin] = true

					module.ready = true
					for p, _ in pairs (self.__module_loaded_plugins [module.name]) do
						if not self.__module_loaded_plugins [module.name] [p] then
							module.ready = false
							break
						end
					end

					if true == module.ready then
						self.__module_loaded_plugins [module.name] = nil
						vim.api.nvim_exec_autocmds ("User", {
							pattern = "ModuleReady",
							data = module.name,
						})
					end

					break
				end
			end
		end
	end
end

return ModuleLoadTracker
