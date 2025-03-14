if true then
	print ("OLD")
	require ("oldconfig")
else
	local modules = {
		require ("config.UIModule"),
		require ("config.BasicModule"),
	}
	local all_plugins = {}

	for _, module in ipairs (modules) do
		vim.list_extend(all_plugins, module.plugins)
	end

	vim.api.nvim_create_autocmd ("User", {
		pattern = "ModuleUIReady",
		callback = function()
			vim.cmd [[ set background=dark ]]
			vim.cmd [[ color NeoSolarized ]]
		end,
	})

	require ("config.lazy")
	-- Load plugins with lazy.nvim
	require("lazy").setup(all_plugins)
end
