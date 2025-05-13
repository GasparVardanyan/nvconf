local ModuleAction = {
	EventType = {
		Pre = "Pre", Post = "Post"
	}
}
ModuleAction.__index = ModuleAction

function ModuleAction:new (opts)
	local obj = setmetatable ({}, ModuleAction)

	obj.event = opts.event or ModuleAction.EventType.Post
	obj.action = opts.action or function () end

	if "string" == type (opts.plugins) then
		obj.plugins = { opts.plugins }
	else
		obj.plugins = opts.plugins or {}
	end

	return obj
end

return ModuleAction
