-- https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/plugins/treesitter.lua
-- http://www.lazyvim.org/plugins/treesitter
-- https://ofirgall.github.io/learn-nvim/chapters/05-text-objects.html

-- NOTE: always after editing make sure these don't overlap with the native mappings

-- 1 - block
-- 2 - conditional
-- 3 - loop
-- 4 - function
-- 5 - class
-- 6 - parameter
-- 7 - comment

return {
	enable = true,
	select = {
		enable = true,
		lookahead = true,
		keymaps = {
			["ak"] = { query = "@block.outer", desc = "block" },
			["ik"] = { query = "@block.inner", desc = "block" },
			["af"] = { query = "@function.outer", desc = "function " },
			["if"] = { query = "@function.inner", desc = "function " },
			["ai"] = { query = "@parameter.outer", desc = "argument" },
			["ii"] = { query = "@parameter.inner", desc = "argument" },
			["ac"] = { query = "@class.outer", desc = "class" },
			["ic"] = { query = "@class.inner", desc = "class" },

			["al"] = { query = "@loop.outer", desc = "loop" },
			["il"] = { query = "@loop.inner", desc = "loop" },
			["a?"] = { query = "@conditional.outer", desc = "conditional" },
			["i?"] = { query = "@conditional.inner", desc = "conditional" },
			["a/"] = { query = "@comment.outer", desc = "comment" },
			["i/"] = { query = "@comment.outer", desc = "comment" },

			["a1"] = { query = "@block.outer", desc = "block" },
			["i1"] = { query = "@block.inner", desc = "block" },
			["a2"] = { query = "@conditional.outer", desc = "conditional" },
			["i2"] = { query = "@conditional.inner", desc = "conditional" },
			["a3"] = { query = "@loop.outer", desc = "loop" },
			["i3"] = { query = "@loop.inner", desc = "loop" },
			["a4"] = { query = "@function.outer", desc = "function " },
			["i4"] = { query = "@function.inner", desc = "function " },
			["a5"] = { query = "@class.outer", desc = "class" },
			["i5"] = { query = "@class.inner", desc = "class" },
			["a6"] = { query = "@parameter.outer", desc = "argument" },
			["i6"] = { query = "@parameter.inner", desc = "argument" },
			["a7"] = { query = "@comment.outer", desc = "comment" },
			["i7"] = { query = "@comment.outer", desc = "comment" },
		},
	},
	move = {
		enable = true,
		set_jumps = true,
		goto_next_start = {
			["]k"] = { query = "@block.outer", desc = "block" },
			["]f"] = { query = "@function.outer", desc = "function" },
			["]i"] = { query = "@parameter.inner", desc = "argument" },
			["]c"] = { query = "@class.outer", desc = "class" },

			["]1"] = { query = "@block.outer", desc = "block" },
			["]2"] = { query = "@conditional.outer", desc = "conditional" },
			["]3"] = { query = "@loop.outer", desc = "loop" },
			["]4"] = { query = "@function.outer", desc = "function " },
			["]5"] = { query = "@class.outer", desc = "class" },
			["]6"] = { query = "@parameter.inner", desc = "argument" },
			["]7"] = { query = "@comment.outer", desc = "comment" },
		},
		goto_next_end = {
			["]K"] = { query = "@block.outer", desc = "block" },
			["]F"] = { query = "@function.outer", desc = "function" },
			["]I"] = { query = "@parameter.inner", desc = "argument" },
			["]C"] = { query = "@class.outer", desc = "class" },

			["]!"] = { query = "@block.outer", desc = "block" },
			["]@"] = { query = "@conditional.outer", desc = "conditional" },
			["]#"] = { query = "@loop.outer", desc = "loop" },
			["]$"] = { query = "@function.outer", desc = "function " },
			["]%"] = { query = "@class.outer", desc = "class" },
			["]^"] = { query = "@parameter.inner", desc = "argument" },
			["]&"] = { query = "@comment.outer", desc = "comment" },
		},
		goto_previous_start = {
			["[k"] = { query = "@block.outer", desc = "block" },
			["[f"] = { query = "@function.outer", desc = "function" },
			["[i"] = { query = "@parameter.inner", desc = "argument" },
			["[c"] = { query = "@class.outer", desc = "class" },

			["[1"] = { query = "@block.outer", desc = "block" },
			["[2"] = { query = "@conditional.outer", desc = "conditional" },
			["[3"] = { query = "@loop.outer", desc = "loop" },
			["[4"] = { query = "@function.outer", desc = "function " },
			["[5"] = { query = "@class.outer", desc = "class" },
			["[6"] = { query = "@parameter.inner", desc = "argument" },
			["[7"] = { query = "@comment.outer", desc = "comment" },
		},
		goto_previous_end = {
			["[K"] = { query = "@block.outer", desc = "block" },
			["[F"] = { query = "@function.outer", desc = "function" },
			["[I"] = { query = "@parameter.inner", desc = "argument" },
			["[C"] = { query = "@class.outer", desc = "class" },

			["[!"] = { query = "@block.outer", desc = "block" },
			["[@"] = { query = "@conditional.outer", desc = "conditional" },
			["[#"] = { query = "@loop.outer", desc = "loop" },
			["[$"] = { query = "@function.outer", desc = "function " },
			["[%"] = { query = "@class.outer", desc = "class" },
			["[^"] = { query = "@parameter.inner", desc = "argument" },
			["[&"] = { query = "@comment.outer", desc = "comment" },
		},
	},
	swap = {
		enable = true,
		swap_next = {
			[">K"] = { query = "@block.outer", desc = "block" },
			[">F"] = { query = "@function.outer", desc = "function" },
			[">I"] = { query = "@parameter.inner", desc = "argument" },
			[">C"] = { query = "@class.outer", desc = "class" },

			[">1"] = { query = "@block.outer", desc = "block" },
			[">2"] = { query = "@conditional.outer", desc = "conditional" },
			[">3"] = { query = "@loop.outer", desc = "loop" },
			[">4"] = { query = "@function.outer", desc = "function " },
			[">5"] = { query = "@class.outer", desc = "class" },
			[">6"] = { query = "@parameter.inner", desc = "argument" },
			[">7"] = { query = "@comment.outer", desc = "comment" },
		},
		swap_previous = {
			["<K"] = { query = "@block.outer", desc = "block" },
			["<F"] = { query = "@function.outer", desc = "function" },
			["<I"] = { query = "@parameter.inner", desc = "argument" },
			["<C"] = { query = "@class.outer", desc = "class" },

			["<1"] = { query = "@block.outer", desc = "block" },
			["<2"] = { query = "@conditional.outer", desc = "conditional" },
			["<3"] = { query = "@loop.outer", desc = "loop" },
			["<4"] = { query = "@function.outer", desc = "function " },
			["<5"] = { query = "@class.outer", desc = "class" },
			["<6"] = { query = "@parameter.inner", desc = "argument" },
			["<7"] = { query = "@comment.outer", desc = "comment" },
		},
	},
}
