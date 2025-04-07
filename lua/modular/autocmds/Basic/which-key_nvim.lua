local wk = require("which-key")
wk.add({
	{ "<leader>D", group = "dadbod" },
	{ "<leader>a", group = "avante" },
	{ "<leader>c", group = "compiler" },
	{ "<leader>d", group = "dap" },
	{ "<leader>df", group = "dap telescope" },
	{ "<leader>ds", group = "dap step" },
	{ "<leader>f", group = "telescope" },
	{ "<leader>fu", group = "telescope undo" },
	{ "<leader>g", group = "git" },
	{ "<leader>gr", group = "lsp" },
	{ "<leader>grp", group = "lsp preview" },
	{ "<leader>l", group = "lsp" },
	{ "<leader>lfu", group = "lsp telescope undo" },
	{ "<leader>lf", group = "lsp telescope" },
	{ "<leader>lo", group = "lsp outline" },
	{ "<leader>lp", group = "lsp preview" },
	{ "<leader>lx", group = "lsp trouble" },
	{ "<leader>o", group = "orgmode" },
	{ "<leader>s", group = "grug" },
	{ "<leader>t", group = "neotest" },
	{ "<leader>u", group = "undotree" },
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
