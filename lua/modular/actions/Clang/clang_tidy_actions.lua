local function get_actions (params, diag)
	local actions = {}

	local bufnr = params.bufnr

	local parser = vim.treesitter.get_parser (bufnr, "cpp")
	if nil == parser
	then
		vim.print ('No cpp treesitter parser available')
		return {}
	end

	local tree = parser:parse()[1]
	local root = tree:root()

	local node = root:named_descendant_for_range(
		diag.lnum,
		diag.col,
		diag.lnum,
		diag.col
	)

	if diag.source == "clang-tidy"
	then
		if diag.code == "misc-const-correctness"
		then
			table.insert (actions, {
				title = "Make variable const",
				action = function()
					local n = node

					while n and n:type () ~= "declaration" do
						n = n:parent ()
					end

					if not n then
						return
					end

					local type_node

					for child in n:iter_children () do
						local t = child:type ()
						if
							t == "primitive_type"
							or t == "type_identifier"
							or t == "qualified_identifier"
							or t == "placeholder_type_specifier"
						then
							type_node = child
							break
						end
					end

					if not type_node
					then
						return
					end

					local row, col = type_node:start ()

					vim.api.nvim_buf_set_text(
						bufnr, row, col, row, col,
						{ "const " }
					)
				end,
			})
		end
	elseif diag.source == "cppcheck"
	then
		if diag.code == "noExplicitConstructor"
		then
			table.insert (actions, {
				title = "Make constructor explicit",
				action = function ()
					local n = node

					while n and n:type () ~= "function_declarator" do
						n = n:parent ()
					end

					if not n then
						return
					end

					local identifier_node

					for child in n:iter_children ()
					do
						local t = child:type ()
						if t == "identifier"
						then
							identifier_node = child
							break
						end
					end

					if not identifier_node
					then
						return
					end


					local row, col = identifier_node:start ()

					vim.api.nvim_buf_set_text (
						bufnr, row, col, row, col,
						{ "explicit " }
					)
				end
			})
		elseif diag.code == "constVariableReference"
		then
			table.insert (actions, {
				title = "Make variable reference to const",
				action = function ()
					local n = node

					while n and n:type () ~= "declaration" do
						n = n:parent ()
					end

					if not n then
						return
					end

					local type_node

					for child in n:iter_children () do
						if child:type () == "init_declarator" then
							for reference_declarator in child:iter_children () do
								if reference_declarator:type () == "reference_declarator" then
									type_node = child
									break
								end
							end
						end
					end

					if not type_node
					then
						return
					end

					local row, col = type_node:start ()

					vim.api.nvim_buf_set_text(
						bufnr, row, col, row, col,
						{ "const " }
					)
				end
			})
		end
	end

	return actions
end

return {
	name = "clang_tidy_actions",
	method = require("null-ls").methods.CODE_ACTION,
	filetypes = { "cpp" },
	generator = {
		async = false,
		fn = function(params)
			local lnum = params.lsp_params.range.start.line -- 0-based

			local diagnostics = vim.diagnostic.get(params.bufnr, {
				lnum = lnum,
			})

			local actions = {}

			for _, diag in ipairs(diagnostics) do
				vim.list_extend (actions, get_actions (params, diag))
			end

			return actions
		end,
	},
}
