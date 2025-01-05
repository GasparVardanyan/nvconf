require "modules.clangmodule"

vim.api.nvim_create_autocmd({"User"}, {
	pattern = "LazyLoad",
	callback = function(data)
		vim.cmd [[
			colorscheme solarized-osaka
		]]
		if data.data == "nvim-lspconfig" then
		end
	end
})
