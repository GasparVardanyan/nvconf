local hostname = vim.fn.hostname ()

if 1 == hostname:find ("work")
then
	local LspServers = require ("modular.config.lspservers")
	LspServers ["clangd"] = {}
	-- LspServers ["erlang-ls"] = {}
	LspServers ["basedpyright"] = {}
	LspServers ["neocmake"] = {}
	-- LspServers ["pylsp"] = {
	-- 	settings = {
	-- 		pylsp = {
	-- 			plugins = {
	-- 				jedi_completion = {
	-- 					include_params = true,
	-- 				},
	-- 				pycodestyle = {
	-- 					enabled = false,
	-- 				},
	-- 			}
	-- 		}
	-- 	}
	-- }
	LspServers ["ts_ls"] = {}

	local MasonTools = require ("modular.config.masontools")
	vim.list_extend (MasonTools, {
		"clang-format",
		"codelldb",
		"cpplint",
	})

	local TreeSitters = require ("modular.config.treesitters")
	vim.list_extend (TreeSitters, {
		"cmake",
		"cpp",
		-- "erlang"
		"javascript",
		"json",
		"python",
		"cuda",
	})

	local AvanteOpts = require ("modular.config.avanteopts")
	AvanteOpts.provider = "gemini"
	AvanteOpts.providers = {
		gemini = {
			model = "gemini-2.5-pro",
		}
	}
elseif 1 == hostname:find ("website")
then
	local TreeSitters = require ("modular.config.treesitters")
	vim.list_extend (TreeSitters, {
		"html",
		"css",
		"javascript",
	})
end
