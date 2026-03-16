local utils = {}

-- local function dump(o)
--    if type(o) == 'table' then
-- 	  local s = '{ '
-- 	  for k,v in pairs(o) do
-- 		 if type(k) ~= 'number' then k = '"'..k..'"' end
-- 		 s = s .. '['..k..'] = ' .. dump(v) .. ','
-- 	  end
-- 	  return s .. '} '
--    else
-- 	  return tostring(o)
--    end
-- end

local function client_supports_method  (client, method, bufnr)
	if vim.fn.has "nvim-0.11" == 1 then
		return client:supports_method (method, bufnr)
	else
		return client.supports_method (method, { bufnr = bufnr })
	end
end

local map_multi_leader = function (mode, leaders, mapping, action, opts)
	for li = 1, #leaders do
		vim.keymap.set (mode, leaders [li] .. mapping, action, opts or {})
	end
end

local unmap_multi_leader = function (mode, leaders, mapping, opts)
	for li = 1, #leaders do
		vim.keymap.del (mode, leaders [li] .. mapping, opts or {})
	end
end

-- utils.dump = dump
utils.client_supports_method = client_supports_method
utils.map_multi_leader = map_multi_leader
utils.unmap_multi_leader = unmap_multi_leader

utils.nproc = tonumber (vim.fn.system ({"nproc"}))

return utils
