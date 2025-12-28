return {
	"monaqa/dial.nvim",
	config = function ()
		local augend = require("dial.augend")

		require("dial.config").augends:register_group{
			default = {
				-- date with format `yyyy/mm/dd`
				augend.date.new{
					-- pattern = "%Y/%m/%d",
					pattern = "%d/%m/%Y",
					default_kind = "day",
					-- if true, it does not match dates which does not exist, such as 2022/05/32
					only_valid = true,
					-- if true, it only matches dates with word boundary
					word = false,
				},
			},
		}
	end
}
