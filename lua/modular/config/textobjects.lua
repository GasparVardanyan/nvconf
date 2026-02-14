-- https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/plugins/treesitter.lua
-- http://www.lazyvim.org/plugins/treesitter
-- https://ofirgall.github.io/learn-nvim/chapters/05-text-objects.html

-- NOTE: always after editing make sure these don't overlap with the native mappings

return {
	enable = true,
	select = {
		enable = true,
		lookahead = true,
		keymaps = {
			["ak"] = { query = "@block.outer", desc = "around block" },
			["ik"] = { query = "@block.inner", desc = "inside block" },
			["af"] = { query = "@function.outer", desc = "around function " },
			["if"] = { query = "@function.inner", desc = "inside function " },
			["ai"] = { query = "@parameter.outer", desc = "around argument" },
			["ii"] = { query = "@parameter.inner", desc = "inside argument" },
			["ac"] = { query = "@class.outer", desc = "around class" },
			["ic"] = { query = "@class.inner", desc = "inside class" },

			["ao"] = { query = "@loop.outer", desc = "around loop" },
			["io"] = { query = "@loop.inner", desc = "inside loop" },
			["a?"] = { query = "@conditional.outer", desc = "around conditional" },
			["i?"] = { query = "@conditional.inner", desc = "inside conditional" },
			["a/"] = { query = "@comment.outer", desc = "inside comment" },
			["i/"] = { query = "@comment.outer", desc = "around comment" },
		},
	},
	move = {
		enable = true,
		set_jumps = true,
		goto_next_start = {
			["]k"] = { query = "@block.outer", desc = "Next block start" },
			["]f"] = { query = "@function.outer", desc = "Next function start" },
			["]i"] = { query = "@parameter.inner", desc = "Next argument start" },
			["]c"] = { query = "@class.outer", desc = "Next class start" },
		},
		goto_next_end = {
			["]K"] = { query = "@block.outer", desc = "Next block end" },
			["]F"] = { query = "@function.outer", desc = "Next function end" },
			["]I"] = { query = "@parameter.inner", desc = "Next argument end" },
			["]C"] = { query = "@class.outer", desc = "Next class start" },
		},
		goto_previous_start = {
			["[k"] = { query = "@block.outer", desc = "Previous block start" },
			["[f"] = { query = "@function.outer", desc = "Previous function start" },
			["[i"] = { query = "@parameter.inner", desc = "Previous argument start" },
			["[c"] = { query = "@class.outer", desc = "Previous class start" },
		},
		goto_previous_end = {
			["[K"] = { query = "@block.outer", desc = "Previous block end" },
			["[F"] = { query = "@function.outer", desc = "Previous function end" },
			["[I"] = { query = "@parameter.inner", desc = "Previous argument end" },
			["[C"] = { query = "@class.outer", desc = "Previous class start" },
		},
	},
	swap = {
		enable = true,
		swap_next = {
			[">K"] = { query = "@block.outer", desc = "Swap next block" },
			[">F"] = { query = "@function.outer", desc = "Swap next function" },
			[">I"] = { query = "@parameter.inner", desc = "Swap next argument" },
			[">C"] = { query = "@class.outer", desc = "Swap next class" },
		},
		swap_previous = {
			["<K"] = { query = "@block.outer", desc = "Swap previous block" },
			["<F"] = { query = "@function.outer", desc = "Swap previous function" },
			["<I"] = { query = "@parameter.inner", desc = "Swap previous argument" },
			["<C"] = { query = "@class.outer", desc = "Swap previous class" },
		},
	},
}
