local Module = {}
Module.__index = Module

function Module:new (opts)
	local obj = setmetatable ({}, Module)
	obj.name = opts.name
	obj.plugins = opts.plugins or {}
	obj.priority = opts.priority or 50 -- lazy.nvim's default value
	obj.ready = false -- NOTE: can be used for generic stuff
	obj.actions = opts.actions or {}

	return obj
end

return Module
