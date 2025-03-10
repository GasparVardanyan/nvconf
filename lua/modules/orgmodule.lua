vim.api.nvim_create_autocmd({"User"}, {
	pattern = "LazyDone",

	callback = function()
		require ("lazy").load ({
			plugins = {
				"neorg",
				-- "orgmode"
			}
		})

		vim.api.nvim_create_autocmd ({"BufNewFile", "BufReadPost"}, {
			pattern = {
				"*.norg"
				, "*.org"
			},
			callback = function ()
				vim.cmd [[setlocal nonu nornu conceallevel=3 foldlevel=3 concealcursor=nv]]
				vim.cmd [[IlluminateToggleBuf]]
			end,
		})

--		vim.api.nvim_create_autocmd ({"BufWritePre"}, {
--			pattern = {
--				"*.norg"
--				, "*.org"
--			},
--			callback = function ()
--				vim.cmd [[norm gg=G]]
--			end,
--		})
	end
})
