return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false, -- Never set this value to "*"! Never!
	opts = function ()
		return vim.tbl_deep_extend ("force", {
			-- system_prompt = function()
			-- 	local hub = require("mcphub").get_hub_instance()
			-- 	return hub:get_active_servers_prompt()
			-- end,
			-- -- The custom_tools type supports both a list and a function that returns a list. Using a function here prevents requiring mcphub before it's loaded
			-- custom_tools = function()
			-- 	return {
			-- 		require("mcphub.extensions.avante").mcp_tool(),
			-- 	}
			-- end,
		},
		require ("modular.config.avanteopts"))
	end,
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	build = "make",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		-- "nvim-mini/mini.pick", -- for file_selector provider mini.pick
		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
		-- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
		"ibhagwan/fzf-lua", -- for file_selector provider fzf
		"stevearc/dressing.nvim", -- for input provider dressing
		-- "folke/snacks.nvim", -- for input provider snacks
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		"zbirenbaum/copilot.lua", -- for providers='copilot'
	},
}
