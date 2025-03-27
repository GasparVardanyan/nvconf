local utils = {
	-- try vim.inspect
	dump = function(o)
	   if type(o) == 'table' then
		  local s = '{ '
		  for k,v in pairs(o) do
			 if type(k) ~= 'number' then k = '"'..k..'"' end
			 s = s .. '['..k..'] = ' .. dump(v) .. ','
		  end
		  return s .. '} '
	   else
		  return tostring(o)
	   end
	end,

	client_supports_method = function (client, method, bufnr)
		if vim.fn.has "nvim-0.11" == 1 then
			return client:supports_method (method, bufnr)
		else
			return client.supports_method (method, { bufnr = bufnr })
		end
	end,
}

return utils
