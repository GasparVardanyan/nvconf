local PostPluginLoadAction = {}
PostPluginLoadAction.__index = PostPluginLoadAction

function PostPluginLoadAction:new (opts)
	local obj = setmetatable ({}, PostPluginLoadAction)
	obj.plugins = opts.plugins or {}
	if "string" == type (opts.plugins) then
		obj.plugins = { opts.plugins }
	else
		obj.plugins = opts.plugins or {}
	end
	obj.action = opts.action or function () end
	return obj

	-- TODO: optimize plugin related checks:

--	obj.plugins = {}
--	if "string" == type (opts.plugins) then
--		obj.plugins [opts.plugins] = false
--	elseif "table" == type (opts.plugins) then
--		for _, plugin in ipairs (opts.plugins) do
--			obj.plugins [plugin] = false
--			print ("REGPLUGDEP " .. plugin .. "\n")
--		end
--	else
--		obj.plugins = {}
--		obj.action = function () end
--	end

end

return PostPluginLoadAction
