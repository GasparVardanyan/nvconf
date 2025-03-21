local Module = {}
Module.__index = Module

function Module:new (opts)
	local obj = setmetatable ({}, Module)
	obj.name = opts.name
	obj.plugins = opts.plugins or {}
	obj.priority = opts.priority or 50 -- lazy.nvim's default value
	obj.ready = false
	obj.post_plugin_load_actions = opts.post_plugin_load_actions or {}

	return obj
end

return Module
