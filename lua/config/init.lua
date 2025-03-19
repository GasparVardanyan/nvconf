if true then
	require ("oldconfig")
else
	require ("config.lazy")
	require ("config.autocmds.generic")
	require ("config.mappings.generic")

	local ModuleManager = require ("config.ModuleManager")
	local mm = ModuleManager:new ()
end
