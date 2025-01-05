require "mappings.general"

vim.api.nvim_create_autocmd({"User"}, {
	pattern = "LazyLoad",
	callback = function(data)
		if data.data == "gitsigns.nvim" then
			require "mappings.gitsigns"
		elseif data.data == "nvim-tree.lua" then
			require "mappings.nvim-tree"
		elseif data.data == "telescope.nvim" then
			require "mappings.telescope"
		elseif data.data == "nvim-spectre" then
			require "mappings.spectre"
		elseif data.data == "lazygit.nvim" then
			require "mappings.lazygit"
		elseif data.data == "undotree" then
			require "mappings.undotree"
		elseif data.data == "tagbar" then
			require "mappings.tagbar"
		elseif data.data == "nvim-lspconfig" then
			require "mappings.lspconfig"
		end
	end
})
