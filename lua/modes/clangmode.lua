vim.api.nvim_create_autocmd({"User"}, {
	pattern = "LazyLoad",
	callback = function(data)
		if data.data == "nvim-lspconfig" then
			local lspconfig = require ("lspconfig")
			lspconfig.clangd.setup ({})
		end
	end
})
