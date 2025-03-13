vim.api.nvim_create_autocmd({"User"}, {
	pattern = "LazyLoad",
	callback = function(data)
		-- basic
			if data.data == "telescope.nvim" then
		elseif data.data == "telescope-tabs" then
		elseif data.data == "telescope-ui-select.nvim" then
		elseif data.data == "telescope-undo.nvim" then
		elseif data.data == "nvim-autopairs" then
		elseif data.data == "nvim-tree.lua" then
		elseif data.data == "nvim-spectre" then
		elseif data.data == "grug-far.nvim" then
		elseif data.data == "tagbar" then
		elseif data.data == "undotree" then
		elseif data.data == "nvim-treesitter" then
		elseif data.data == "todo-comments.nvim" then

		-- git
		elseif data.data == "gitsigns.nvim" then
		elseif data.data == "diffview.nvim" then
		elseif data.data == "lazygit.nvim" then
		elseif data.data == "vim-fugitive" then

		-- lsp
		elseif data.data == "mason.nvim" then
		elseif data.data == "mason-lspconfig.nvim" then
		elseif data.data == "nvim-lspconfig" then
		elseif data.data == "nvim-lint" then
		elseif data.data == "trouble.nvim" then
		elseif data.data == "vim-illuminate" then
		elseif data.data == "outline.nvim" then
		elseif data.data == "nvim-treesitter-textobjects" then
		elseif data.data == "nvim-cmp" then
		elseif data.data == "lspsaga.nvim" then
		elseif data.data == "dropbar.nvim" then
		elseif data.data == "blink.cmp" then

		-- dap
		elseif data.data == "nvim-dap" then
		elseif data.data == "mason-nvim-dap.nvim" then
		elseif data.data == "nvim-dap-ui" then

		-- clang
		elseif data.data == "clangd_extensions.nvim" then
		elseif data.data == "cppman.nvim" then

		-- cmake
		elseif data.data == "cmake-tools.nvim" then

		-- org
		elseif data.data == "neorg" then
		elseif data.data == "orgmode" then
		elseif data.data == "vim-table-mode" then

		-- ui
		elseif data.data == "NeoSolarized.nvim" then
		elseif data.data == "solarized.nvim" then
		elseif data.data == "solarized-osaka.nvim" then
		elseif data.data == "lualine.nvim" then
		elseif data.data == "noice.nvim" then

		-- tmux
		elseif data.data == "vim-tmux-navigator" then
		elseif data.data == "vimux" then


		-- none-ls
		elseif data.data == "none-ls.nvim" then

		-- dependencies
		elseif data.data == "plenary.nvim" then
		elseif data.data == "nvim-web-devicons" then
		elseif data.data == "nui.nvim" then
		elseif data.data == "pathlib.nvim" then
		elseif data.data == "nvim-nio" then
		elseif data.data == "lua-utils.nvim" then
		elseif data.data == "nvim-dap-virtual-text" then
		elseif data.data == "nvim-notify" then
		elseif data.data == "cmp_luasnip" then
		elseif data.data == "LuaSnip" then
		elseif data.data == "cmp-cmdline" then
		elseif data.data == "cmp-path" then
		elseif data.data == "cmp-buffer" then
		elseif data.data == "cmp-nvim-lsp" then
		elseif data.data == "image.nvim" then
		elseif data.data == "tree-sitter-norg" then
		elseif data.data == "telescope-fzf-native.nvim" then
		elseif data.data == "friendly-snippets" then
		elseif data.data == "org-bullets.nvim" then
		elseif data.data == "headlines.nvim" then

		else
			print ("new plugin: " .. data.data)
		end
	end
})

require "oldmodules.uimodule"
require "oldmodules.basicmodule"

vim.api.nvim_create_autocmd("FileType", {
	pattern = "hlsplaylist",
	callback = function(args)
		require "modes.hlsmode"
	end
})

-- TODO: conditional inclusion of all modules except ui and basic
require "oldmodules.gitmodule"
require "oldmodules.orgmodule"
require "oldmodules.lspmodule"
-- require "modes.clangmode"
-- require "modules.nonelsmodule"
