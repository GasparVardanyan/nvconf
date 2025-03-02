vim.api.nvim_create_autocmd({"User"}, {
	pattern = "LazyDone",

	callback = function()
		require ("lazy").load ({
			plugins = {
				"neorg",
				"orgmode"
			}
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "org", "norg" },
			callback = function(args)
				vim.cmd [[ set nonu nornu ]]
			end
		})
	end
})
