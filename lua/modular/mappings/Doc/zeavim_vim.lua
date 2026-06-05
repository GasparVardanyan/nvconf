local map = vim.keymap.set

local function zeal_search (docset, query)
    local old_docset = vim.b.manualDocset

    vim.fn ["zeavim#DocsetInBuffer"] (docset)
    vim.fn ["zeavim#SearchFor"] ("", query)

	vim.print ("Searching for " .. query)

    if old_docset ~= nil then
        vim.b.manualDocset = old_docset
    else
        vim.b.manualDocset = nil
    end
end

local function zeal_search_input (docset)
	local query = vim.fn.input("Search for: ")

    if docset ~= "" and query ~= "" then
		zeal_search (docset, query)
    end
end

map ("n", "<leader>zc", function ()
	zeal_search ("c", vim.fn.expand ("<cWORD>"))
end, { desc = "C" })
map ("n", "<leader>zp", function ()
	zeal_search ("cpp", vim.fn.expand ("<cWORD>"))
end, { desc = "C++" })
map ("n", "<leader>zq", function ()
	zeal_search ("qt6", vim.fn.expand ("<cWORD>"))
end, { desc = "Qt6" })

map ("n", "<leader>zC", function ()
	zeal_search_input ("c")
end, { desc = "C - input" })
map ("n", "<leader>zP", function ()
	zeal_search_input ("cpp")
end, { desc = "C++ - input" })
map ("n", "<leader>zQ", function ()
	zeal_search_input ("qt6")
end, { desc = "Qt6 - input" })
