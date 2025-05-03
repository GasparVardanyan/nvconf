local hostname = vim.fn.hostname ()

if "work" == hostname then
	local LspServers = require ("modular.config.lspservers")
	LspServers ["clangd"] = {}
	LspServers ["neocmake"] = {}

	local MasonTools = require ("modular.config.masontools")
	vim.list_extend (MasonTools, {
		"codelldb", "cpplint", "clang-format"
	})

	local TreeSitters = require ("modular.config.treesitters")
	vim.list_extend (TreeSitters, {
		"cpp"
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
