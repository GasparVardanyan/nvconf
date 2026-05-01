local hostname = vim.fn.hostname ()

-- require ("modular.config.ui2")

local LazyOpts = require ("modular.config.lazy")
local TreeSitters = require ("modular.config.treesitters")
local LspServers = require ("modular.config.lspservers")
local MasonTools = require ("modular.config.masontools")
local AvanteOpts = require ("modular.config.avanteopts")
-- local LintersByFt = require ("modular.config.linters_by_ft")

LazyOpts.dev = {
	path = "/desktop/nvim_plugins/"
}

if 1 == hostname:find ("devenv")
then
	-- LspServers ["erlang-ls"] = {}
	-- LspServers ["basedpyright"] = {}
	LspServers ["perlnavigator"] = {}
	-- LspServers ["java-language-server"] = {}
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
	-- LspServers ["ts_ls"] = {}

	vim.list_extend (MasonTools, { "perl-debug-adapter" })

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
	vim.list_extend (TreeSitters, {
		"html",
		"css",
		"javascript",
	})
end
