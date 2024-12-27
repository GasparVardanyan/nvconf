vim.api.nvim_create_autocmd({"User"}, {
	pattern = "LazyDone",

	callback = function()
		require ("lazy").load ({
			plugins = {
				"clangd_extensions.nvim"
			}
		})
	end
})

vim.api.nvim_create_autocmd({"User"}, {
	pattern = "LazyLoad",
	callback = function(data)
		if data.data == "nvim-lspconfig" then
			local lspconfig = require ("lspconfig")
			lspconfig.clangd.setup ({})
		end
	end
})
