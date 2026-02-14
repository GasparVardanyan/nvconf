local base46_path = vim.fn.stdpath ("data") .. "/lazy/base46/lua/base46/themes"
local proxy_dir = vim.fn.stdpath ("state") .. "/base46_proxy"
local colors_dir = proxy_dir .. "/colors"

return {
	"NvChad/base46",
	dependencies = {
		"NvChad/ui"
	},
	lazy = false,
	priority = 1000,
	build = function ()
		if vim.fn.isdirectory (proxy_dir) == 1 then
			vim.fn.delete (proxy_dir, "rf")
		end

		if vim.fn.isdirectory (colors_dir) == 0 then
			vim.fn.mkdir (colors_dir, "p")
		end

		for name in vim.fs.dir (base46_path) do
			local theme = name:match ("(.+)%.lua$")
			if theme then
				local proxy_file = colors_dir .. "/NV_" .. theme .. ".lua"

				if vim.fn.filereadable (proxy_file) == 0 then
					local f = io.open (proxy_file, "w")
					if f then
						f:write (string.format ([[
							vim.cmd "highlight clear"
							require ("nvconfig").base46.theme = "%s"
							require ("base46").load_all_highlights ()
						]], theme))
						f:close ()
					end
				end
			end
		end
	end,
	init = function ()
		vim.g.base46_cache = vim.fn.stdpath ("cache") .. "/base46"
		vim.api.nvim_create_autocmd ("User", {
			pattern = "NvThemeReload",
			callback = function ()
				vim.api.nvim_set_hl (0, 'LspSignatureActiveParameter', { underline=true })
			end,
		})
	end,
	config = function (_, opts)
		local nvconfig = require ("nvconfig")
		nvconfig.base46 = vim.tbl_deep_extend ("force", nvconfig.base46, opts)

		vim.fn.mkdir (vim.g.base46_cache, "p")

		require ("base46").load_all_highlights ()

		vim.opt.rtp:append (proxy_dir)
	end,
}
