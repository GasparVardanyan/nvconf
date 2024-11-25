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
		elseif data.data == "plenary.nvim" then
		elseif data.data == "nvim-spectre" then
			require "mappings.spectre"
		elseif data.data == "lazygit.nvim" then
			require "mappings.lazygit"
		elseif data.data == "diffview.nvim" then
		elseif data.data == "trouble.nvim" then
		elseif data.data == "nvim-treesitter" then
		elseif data.data == "nvim-web-devicons" then
		elseif data.data == "NeoSolarized.nvim" then
		elseif data.data == "solarized.nvim" then
		elseif data.data == "solarized-osaka.nvim" then
		else
			print (data.data)
		end
	end
})
