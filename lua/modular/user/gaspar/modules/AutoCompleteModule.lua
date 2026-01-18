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
					NONE         =  "__NONE__"             ,
				}

				local current_action = ACMPL.NONE

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

					if 0 ~= #completions
					then
						local targetlen = completions [1]:len ()

						local matches = { completions [1] }
						for i = 2, #completions, 4 do
							table.insert (matches, completions [i])
						end

						vim.fn.complete (vim.fn.col (".") - targetlen, matches)
					else
						current_action = ACMPL.NONE
					end
				end

				vim.api.nvim_create_autocmd ("CompleteDone", {
					callback = function ()
						current_action = ACMPL.NONE
					end
				})

				local function pum_or_complete (action)
					if ACMPL.NONE == current_action
					then
						vim.schedule (function ()
							current_action = action
							complete (action)
						end)
						return ""
					else
						if action == current_action
						then
							return "<C-n>"
						else
							vim.api.nvim_feedkeys(
								vim.api.nvim_replace_termcodes("<C-e>", true, false, true),
								"n",
								false
							)
							vim.schedule (function ()
								current_action = action
								complete (action)
							end)
							return ""
						end
					end
				end

				vim.keymap.set ("i",   "<M-C-/>",   function () return pum_or_complete (ACMPL.WORD) end,          { expr = true })
				vim.keymap.set ("i",   "<M-C-.>",   function () return pum_or_complete (ACMPL.FUZZY_WORD) end,    { expr = true })
				vim.keymap.set ("i",   "<M-C-,>",   function () return pum_or_complete (ACMPL.FUZZY) end,         { expr = true })
				vim.keymap.set ("i",   "<M-C-'>",   function () return pum_or_complete (ACMPL.SUFFIX) end,        { expr = true })
				vim.keymap.set ("i",   "<M-C-;>",   function () return pum_or_complete (ACMPL.SURROUND) end,      { expr = true })
				vim.keymap.set ("i",   "<M-C-]>",   function () return pum_or_complete (ACMPL.WWORD) end,         { expr = true })
				vim.keymap.set ("i",   "<M-Esc>",   function () return pum_or_complete (ACMPL.FUZZY_WWORD) end,   { expr = true })
			end
		})
	}
})

return AutoCompleteModule
