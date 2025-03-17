local Module = require ("config.Module")

--vim.api.nvim_create_autocmd ({"BufNewFile", "BufReadPost"}, {
--	pattern = {
--		"*.norg"
--		, "*.org"
--	},
--	callback = function ()
--		vim.cmd [[setlocal nonu nornu conceallevel=3 concealcursor=nv]]
--		vim.cmd [[IlluminateToggleBuf]]
--	end,
--})
--vim.api.nvim_create_autocmd ({"BufWritePre"}, {
--	pattern = {
--		"*.norg"
--		, "*.org"
--	},
--	callback = function ()
--		vim.cmd [[norm gg=G]]
--	end,
--})

local OrgModule = Module:new ({
	name = "Org",
	plugins = {
		require ("config.specs.misc.image_nvim"),
		require ("config.specs.Org.neorg"),
		require ("config.specs.Org.orgmode"),
	}
})

return OrgModule
