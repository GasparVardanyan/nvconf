local Module = require ("config.Module")

local GitModule = Module:new ({
	name = "Git",
	plugins = {
		require ("config.specs.Git.gitsigns_nvim"),
		require ("config.specs.Git.diffview_nvim"),
		require ("config.specs.Git.lazygit_nvim"),
		require ("config.specs.Git.vim-fugitive"),
	}
})

return GitModule
