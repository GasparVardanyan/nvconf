local hostname = vim.fn.hostname ()

if 1 == hostname:find ("work")
then
	local LspServers = require ("modular.config.lspservers")
	LspServers ["clangd"] = {}
	-- LspServers ["erlang-ls"] = {}
	LspServers ["neocmake"] = {}
	LspServers ["pylsp"] = {
		settings = {
			pylsp = {
				plugins = {
					jedi_completion = {
						include_params = true,
					},
					pycodestyle = {
						enabled = false,
					},
				}
			}
		}
	}
	LspServers ["ts_ls"] = {}

	local MasonTools = require ("modular.config.masontools")
	vim.list_extend (MasonTools, {
		"clang-format",
		"codelldb",
		"cpplint",
		"debugpy",
		-- "erlang-debugger"
	})

	local TreeSitters = require ("modular.config.treesitters")
	vim.list_extend (TreeSitters, {
		"cpp",
		-- "erlang"
		"javascript",
		"json",
		"python",
	})
end

local AvanteOpts = require ("modular.config.avanteopts")
AvanteOpts.provider = "gemini"
-- AvanteOpts.aihubmix = {
-- 	model = "DeepSeek-V3",
-- }
AvanteOpts.gemini = {
	model = "gemini-2.5-flash-preview-04-17",
}
