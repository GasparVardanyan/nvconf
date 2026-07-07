local nvopts = require ("nvconfig").base46
local themes = nvopts.theme_toggle

vim.api.nvim_create_user_command (
	"Base46Toggle",
	function ()
		local nvopts = require ("nvconfig").base46
		local themes = nvopts.theme_toggle

		local theme_to_set = ''

		if nvopts.theme == themes [1]
		then
			theme_to_set = themes [2]
		elseif nvopts.theme == themes [2]
		then
			theme_to_set = themes [1]
		end

		if '' ~= theme_to_set
		then
			vim.cmd.colorscheme ("chad_" .. theme_to_set)
			-- vim.print ("setting theme to " .. theme_to_set)
			-- vim.cmd "highlight clear"
			-- vim.o.background = require ("base46.themes." .. theme_to_set).type
			-- require ("nvconfig").base46.theme = theme_to_set
			-- require ("base46").load_all_highlights ()
		end
	end, {
		desc = "Base46 toggle"
	}
)
