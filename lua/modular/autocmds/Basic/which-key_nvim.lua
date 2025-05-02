local wk = require("which-key")
wk.add({
	-- Basic:
	{ "<leader>f", group = "telescope" },
	{ "<leader>fu", group = "undo" },
	{ "<leader>p", group = "project" },
	{ "<leader>s", group = "grug" },
	{ "<leader>u", group = "undotree" },

	-- Compiler:
	{ "<leader>c", group = "compiler" },
	{ "<leader>co", group = "cmake open" },
	{ "<leader>cc", group = "cmake close" },
	{ "<leader>cs", group = "cmake stop" },

	-- Dap:
	{ "<leader>d", group = "dap" },
	{ "<leader>ds", group = "step" },
	{ "<leader>df", group = "telescope" },

	-- Db:
	{ "<leader>D", group = "dadbod" },

	-- Git:
	{ "<leader>g", group = "git" },

	-- Lsp:
	{ "gr", group = "lsp" },
	{ "grf", group = "telescope" },
	{ "gro", group = "outline" },
	{ "grp", group = "preview" },
	{ "grw", group = "workspace" },
	{ "grx", group = "trouble" },
	{ "<leader>l", group = "lsp" },
	{ "<leader>lf", group = "telescope" },
	{ "<leader>lo", group = "outline" },
	{ "<leader>lp", group = "preview" },
	{ "<leader>lw", group = "workspace" },
	{ "<leader>lx", group = "trouble" },
	{ "<leader>w", group = "workspace" },

	-- Test:
	{ "<leader>t", group = "neotest" },

	-- Ai:
	{ "<leader>a", group = "avante" },

	-- Org:
	{ "<leader>o", group = "orgmode" },

	-- Generic:
	{ "<leader>v", group = "vim" },

	-- { "<leader>f", group = "file" }, -- group
	-- { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
	-- { "<leader>fb", function() print("hello") end, desc = "Foobar" },
	-- { "<leader>fn", desc = "New File" },
	-- { "<leader>f1", hidden = true }, -- hide this keymap
	-- { "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
	-- { "<leader>b", group = "buffers", expand = function()
	-- 	return require("which-key.extras").expand.buf()
	-- end
	-- },
	-- {
	-- 	-- Nested mappings are allowed and can be added in any order
	-- 	-- Most attributes can be inherited or overridden on any level
	-- 	-- There's no limit to the depth of nesting
	-- 	mode = { "n", "v" }, -- NORMAL and VISUAL mode
	-- 	{ "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
	-- 	{ "<leader>w", "<cmd>w<cr>", desc = "Write" },
	-- }
})
