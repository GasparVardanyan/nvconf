local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local AutoCompleteModule = Module:new ({
	name = "AutoComplete",
	actions = {
		ModuleAction:new ({
			action = function ()
				local ACMPL = {
					WORD         =  "word-complete"        ,
					WWORD        =  "WORD-complete"        ,
					FUZZY_WORD   =  "fuzzy-word-complete"  ,
					FUZZY_WWORD  =  "fuzzy-WORD-complete"  ,
					FUZZY        =  "fuzzy-complete"       ,
					SUFFIX       =  "suffix-complete"      ,
					SURROUND     =  "surround-complete"    ,
				}

				local function complete (action)
					local win = vim.api.nvim_get_current_win ()
					local buf = vim.api.nvim_win_get_buf (win)

					local first = vim.fn.line ("w0")
					local last = vim.fn.line ("w$")

					local lines = vim.api.nvim_buf_get_lines (buf, first - 1, last, false)

					local pos = vim.api.nvim_win_get_cursor (win)
					local cur_row_buf, cur_col = pos [1], pos [2]

					local cur_row_file = cur_row_buf - first

					local completions = vim.fn.systemlist (
						"acmpl " .. action .. " " .. cur_row_file .. " " .. cur_col,
						lines
					)

					local targetlen = completions [1]:len ()

					local matches = { completions [1] }
					for i = 2, #completions, 4 do
						table.insert (matches, completions [i])
					end

					vim.fn.complete (vim.fn.col (".") - targetlen, matches)
				end

				vim.keymap.set ("i", "<M-C-/>", function () complete (ACMPL.WORD) end)
				vim.keymap.set ("i", "<M-C-.>", function () complete (ACMPL.FUZZY_WORD) end)
				vim.keymap.set ("i", "<M-C-,>", function () complete (ACMPL.FUZZY) end)
				vim.keymap.set ("i", "<M-C-'>", function () complete (ACMPL.SUFFIX) end)
				vim.keymap.set ("i", "<M-C-;>", function () complete (ACMPL.SURROUND) end)
				vim.keymap.set ("i", "<M-C-]>", function () complete (ACMPL.WWORD) end)
				vim.keymap.set ("i", "<M-Esc>", function () complete (ACMPL.FUZZY_WWORD) end)
				-- TODO: implement an undo mapping
			end
		})
	}
})

return AutoCompleteModule
