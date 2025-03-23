vim.cmd [[
	command -range=% Encrypt execute "'<,'>!gcrypt -S -e \"$(pass show pdata)\" | base64"
	command -range=% Decrypt execute "'<,'>!base64 -d | gcrypt -S -d \"$(pass show pdata)\""
]]
