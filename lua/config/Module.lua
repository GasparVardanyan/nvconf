local Module = {}
Module.__index = Module

function Module:new (opts)
	local obj = setmetatable ({}, Module)
	obj.name = opts.name
	obj.plugins = opts.plugins or {}
	obj.loaded_plugins = {}
	obj.ready_autocmd_pattern = "Module" .. opts.name .. "Ready"
	obj.priority = opts.priority or 50 -- lazy's default value

	for _, spec in ipairs(obj.plugins) do
		spec.priority = spec.priority or obj.priority
		local plugin_name = spec [1]:match (".*/(.*)")
		print ("Priority: " .. spec.priority .. ", name: " .. plugin_name .. "\n")
		obj.loaded_plugins [plugin_name] = false
	end

	obj.lazy_load_handler = vim.api.nvim_create_autocmd ("User", {
		pattern = "LazyLoad",
		callback = function (data)
			obj:mark_plugin_loaded (data.data)
		end,
	})

	return obj
end

function Module:mark_plugin_loaded (plugin)
	for p, _ in pairs (self.loaded_plugins) do
		if p == plugin then
			self.loaded_plugins [plugin] = true
			self:check_ready ()
			break
		end
	end
end

function Module:check_ready ()
	local ready = true
	for p, _ in pairs (self.loaded_plugins) do
		if not self.loaded_plugins [p] then
			ready = false
			break
		end
	end

	if true == ready then
		vim.api.nvim_del_autocmd (self.lazy_load_handler)
		self.lazy_load_handler = nil
		vim.api.nvim_exec_autocmds ("User", {
			pattern = self.ready_autocmd_pattern,
			data = self.name
		})
	end
end

return Module
