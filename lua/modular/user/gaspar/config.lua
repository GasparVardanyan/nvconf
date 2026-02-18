local hostname = vim.fn.hostname ()

if 1 == hostname:find ("devenv")
then
	local LspServers = require ("modular.config.lspservers")
	LspServers ["clangd"] = {}
	-- LspServers ["erlang-ls"] = {}
	-- LspServers ["basedpyright"] = {}
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
		-- "javascript",
		"json",
		-- "python",
		-- "cuda",
	})

	local AvanteOpts = require ("modular.config.avanteopts")
	AvanteOpts.provider = "openrouter_deepseek"
	AvanteOpts.providers = {
		openrouter_deepseek = {
			__inherited_from = "openai",
			endpoint = "https://openrouter.ai/api/v1",
			model = "openrouter/free",
			api_key_name = "OPENROUTER_API_KEY",
			-- extra_request_body = {
			-- 	max_tokens = 16384,
			-- },
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
