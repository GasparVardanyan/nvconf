vim.api.nvim_create_autocmd({"User"}, {
	pattern = "LazyLoad",
	callback = function(data)
		if data.data == "telescope.nvim" then
		elseif data.data == "telescope-tabs" then
		elseif data.data == "nvim-tree.lua" then
		elseif data.data == "nvim-spectre" then
		elseif data.data == "tagbar" then
		elseif data.data == "undotree" then
		elseif data.data == "nvim-treesitter" then

		elseif data.data == "gitsigns.nvim" then
		elseif data.data == "diffview.nvim" then
		elseif data.data == "lazygit.nvim" then

		elseif data.data == "mason.nvim" then
		elseif data.data == "mason-lspconfig.nvim" then
		elseif data.data == "nvim-lspconfig" then
		elseif data.data == "trouble.nvim" then
		elseif data.data == "vim-illuminate" then
		elseif data.data == "clangd_extensions.nvim" then

		elseif data.data == "neorg" then

		elseif data.data == "NeoSolarized.nvim" then
		elseif data.data == "solarized.nvim" then
		elseif data.data == "solarized-osaka.nvim" then

		elseif data.data == "plenary.nvim" then
		elseif data.data == "nvim-web-devicons" then
		elseif data.data == "nui.nvim" then
		elseif data.data == "pathlib.nvim" then
		elseif data.data == "nvim-nio" then
		elseif data.data == "lua-utils.nvim" then

		else
			print ("new plugin: " .. data.data)
		end
	end
})

require "modules.uimodule"
require "modules.basicmodule"
require "modules.gitmodule"
require "modules.orgmodule"
require "modules.lspmodule"
-- require "modes.clangmode"
