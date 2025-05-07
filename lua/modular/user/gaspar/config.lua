local hostname = vim.fn.hostname ()

if 1 == hostname:find ("work")
then
	local LspServers = require ("modular.config.lspservers")
	LspServers ["clangd"] = {}
	LspServers ["neocmake"] = {}
	LspServers ["pylsp"] = {}
	LspServers ["ts_ls"] = {}
	-- LspServers ["erlang-ls"] = {}

	local MasonTools = require ("modular.config.masontools")
	vim.list_extend (MasonTools, {
		"codelldb",
		"cpplint",
		"clang-format",
		"debugpy",
		-- "erlang-debugger"
	})

	local TreeSitters = require ("modular.config.treesitters")
	vim.list_extend (TreeSitters, {
		"cpp",
		"javascript",
		"python",
		-- "erlang"
	})

	local AvanteOpts = require ("modular.config.avanteopts")
	AvanteOpts.provider = "gemini"
	-- AvanteOpts.aihubmix = {
	-- 	model = "DeepSeek-V3",
	-- }
	AvanteOpts.gemini = {
		model = "gemini-2.5-flash-preview-04-17",
	}
end
