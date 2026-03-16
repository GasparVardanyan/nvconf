local hostname = vim.fn.hostname ()

local LazyOpts = require ("modular.config.lazy")
local TreeSitters = require ("modular.config.treesitters")
local LspServers = require ("modular.config.lspservers")
local MasonTools = require ("modular.config.masontools")
local AvanteOpts = require ("modular.config.avanteopts")
local LintersByFt = require ("modular.config.linters_by_ft")

LazyOpts.dev = {
	path = "/desktop/nvim_plugins/"
}

if 1 == hostname:find ("devenv")
then
	LspServers ["clangd"] = {
		cmd = {
			"clangd",
			"--background-index",
			"--j=" .. (require ("modular.utils").nproc - 1),
			"--header-insertion=iwyu",
			"--clang-tidy",
		},
	}
	-- LspServers ["erlang-ls"] = {}
	-- LspServers ["basedpyright"] = {}
	LspServers ["neocmake"] = {}
	LspServers ["perlnavigator"] = {}
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

	vim.list_extend (MasonTools, {
		"clang-format",
		"codelldb",
		"cpplint",
		"perl-debug-adapter",
	})

	vim.list_extend (TreeSitters, {
		"cmake",
		"cpp",
		-- "cuda",
		-- "erlang",
		"http",
		-- "javascript",
		"json",
		-- "python",
	})

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

	LintersByFt ["c"] = {
		-- "clangtidy",
		"cppcheck",
	}

	LintersByFt ["cpp"] = {
		-- "clangtidy",
		"cppcheck",
	}
elseif 1 == hostname:find ("website")
then
	vim.list_extend (TreeSitters, {
		"html",
		"css",
		"javascript",
	})
end
