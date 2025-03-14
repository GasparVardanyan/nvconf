local Module = {}
Module.__index = Module

function Module:new (name, plugins)
	-- TODO: Make plugin.priority as parameter and set to all plugins
	local self = setmetatable ({}, Module)
	self.name = name
	self.plugins = plugins or {}
	self.loaded_plugins = {}
	self.ready_autocmd_pattern = "Module" .. name .. "Ready"

	for _, repo in ipairs(plugins) do
		local plugin_name = repo [1]:match (".*/(.*)")
		self.loaded_plugins [plugin_name] = false
	end

	self.lazy_load_handler = vim.api.nvim_create_autocmd ({"User"}, {
		pattern = "LazyLoad",
		callback = function (data)
			self:mark_plugin_loaded (data.data)
		end,
	})

	return self
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
			pattern = self.ready_autocmd_pattern
		})
	end
end

return Module
