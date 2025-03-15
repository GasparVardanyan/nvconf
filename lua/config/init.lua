if true then
	require ("oldconfig")
else
	require ("config.lazy")

	local ModuleManager = require ("config.ModuleManager")
	local mm = ModuleManager:new ()
end
