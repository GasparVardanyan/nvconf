local Module = {}
Module.__index = Module

function Module:new (name, plugins)
	local obj = setmetatable ({}, self)
	-- obj.name = name
	obj.plugins = plugins or {}
	obj.loaded_plugins = {}
	obj.ready_autocmd_pattern = "Module" .. name .. "Ready"

	for _, repo in ipairs(plugins) do
		local plugin_name = repo [1]:match (".*/(.*)")
		obj.loaded_plugins [plugin_name] = false
	end

	vim.api.nvim_create_autocmd ({"User"}, {
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
		vim.api.nvim_exec_autocmds ("User", {
			pattern = self.ready_autocmd_pattern
		})
	end
end

return Module
