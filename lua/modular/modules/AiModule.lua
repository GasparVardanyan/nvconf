local Module = require ("modular.Module")
local PostPluginLoadAction = require ("modular.PostPluginLoadAction")

local AiModule = Module:new ({
	name = "Ai",
	priority = 1000,
	plugins = {
		-- {
		-- 	"ravitemer/mcphub.nvim",
		-- 	dependencies = {
		-- 		"nvim-lua/plenary.nvim",  -- Required for Job and HTTP requests
		-- 	},
		-- 	-- comment the following line to ensure hub will be ready at the earliest
		-- 	cmd = "MCPHub",  -- lazy load by default
		-- 	build = "npm install -g mcp-hub@latest",  -- Installs required mcp-hub npm module
		-- 	-- uncomment this if you don't want mcp-hub to be available globally or can't use -g
		-- 	-- build = "bundled_build.lua",  -- Use this and set use_bundled_binary = true in opts  (see Advanced configuration)
		-- 	config = function()
		-- 		require("mcphub").setup()
		-- 	end,
		-- },
		{
			"yetone/avante.nvim",
			event = "VeryLazy",
			version = false, -- Never set this value to "*"! Never!
			opts = {
				provider = "aihubmix",
				aihubmix = {
					model = "DeepSeek-V3",
				},
				hints = { enabled = false },
			},
			-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
			build = "make",

			dependencies = {
				"nvim-treesitter/nvim-treesitter",
				"stevearc/dressing.nvim",
				"nvim-lua/plenary.nvim",
				"MunifTanjim/nui.nvim",
				--- The below dependencies are optional,
				"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
				"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
				"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
				"zbirenbaum/copilot.lua", -- for providers='copilot'
				{
					-- support for image pasting
					"HakonHarnes/img-clip.nvim",
					event = "VeryLazy",
					opts = {
						-- recommended settings
						default = {
							embed_image_as_base64 = false,
							prompt_for_file_name = false,
							drag_and_drop = {
								insert_mode = true,
							},
							-- required for Windows users
							use_absolute_path = true,
						},
					},
				},
			},
		}
	},
	post_plugin_load_actions = {
	}
})

return AiModule
