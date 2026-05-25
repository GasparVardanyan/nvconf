local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local ClangModule = Module:new ({
	name = "Clang",
	plugins = {
		require ("modular.specs.Clang.cppman_nvim"),
		require ("modular.specs.Clang.clangd_extensions_nvim"),
		require ("modular.specs.Clang.insights_nvim"),
		require ("modular.specs.Clang.compiler-explorer_nvim"),
		require ("modular.specs.Clang.classlayout_nvim"),
		require ("modular.specs.Clang.nvim-treesitter-cpp-tools"),
		-- {
		-- 	"simonwinther/cppman.nvim",
		-- 	version = "*",
		-- 	cmd = "CPPMan",
		-- 	name = "cppfzf",
		-- 	dependencies = {
		-- 		"folke/snacks.nvim",
		-- 	},
		-- 	opts = {},
		-- },
	},
	actions = {
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>C",  "clang")

				require ("modular.autocmds.Clang.iwyu")
				require ("modular.mappings.Clang.iwyu")

				local TreeSitters = require ("modular.config.treesitters")
				local LspServers = require ("modular.config.lspservers")
				local MasonTools = require ("modular.config.masontools")
				local LintersByFt = require ("modular.config.linters_by_ft")
				local Formatters = require ("modular.config.formatters")

				vim.list_extend (TreeSitters, { "c", "cpp" })

				local nproc = require ("modular.utils").nproc
				local jnproc = ''

				if 0 ~= nproc
				then
					jnproc =  "--j=" .. (nproc - 1)
				end

				LspServers ["clangd"] = {
					cmd = {
						"clangd",
						"--background-index",
						jnproc,
						"--header-insertion=iwyu",
						-- "--clang-tidy",
					},
				}

				vim.list_extend (MasonTools, {
					"clang-format",
					"codelldb",
					-- "cpplint",
				})

				if nil == LintersByFt ["c"]
				then
					LintersByFt ["c"] = {}
				end

				vim.list_extend (LintersByFt ["c"], {
					"clangtidy",
					"cppcheck",
					-- "cpplint",
				})

				if nil == LintersByFt ["cpp"]
				then
					LintersByFt ["cpp"] = {}
				end

				vim.list_extend (LintersByFt ["cpp"], {
					"clangtidy",
					"cppcheck",
					-- "cpplint",
				})

				if nil == Formatters.formatters_by_ft ["c"]
				then
					Formatters.formatters_by_ft ["c"]  = {}
				end

				vim.list_extend (Formatters.formatters_by_ft ["c"], {
					"clang-format",
				})

				if nil == Formatters.formatters_by_ft ["cpp"]
				then
					Formatters.formatters_by_ft ["cpp"]  = {}
				end

				vim.list_extend (Formatters.formatters_by_ft ["cpp"], {
					"clang-format",
				})
			end
		}),
		ModuleAction:new ({
			plugins = "nvim-lint",
			action = function ()
				local clang_config = require ("modular.config.clang")

				local clang_standard = function ()
					if vim.bo.filetype == "cpp" then
						return "--extra-arg=-std=" .. clang_config.stdcpp
					elseif vim.bo.filetype == "c" then
						return "--extra-arg=-std=" .. clang_config.stdc
					else
						return ""
					end
				end

				local cppcheck_standard = function ()
					if vim.bo.filetype == "cpp" then
						return "--std=" .. clang_config.stdcpp
					elseif vim.bo.filetype == "c" then
						return "--std=" .. clang_config.stdc
					else
						return ""
					end
				end

				local nproc = require ("modular.utils").nproc
				local cppcheck_jnproc = ''

				if 0 ~= nproc
				then
					cppcheck_jnproc =  "-j " .. (nproc - 1)
				end

				local clang_tidy = require ("lint.linters.clangtidy")
				local cppcheck = require ("lint.linters.cppcheck")

				-- https://clang.llvm.org/extra/clang-tidy/
				vim.list_extend (clang_tidy.args, {
					clang_standard,
					"--checks=*" -- abseil, altera, android, boost, bugprone,
						-- cert, clang, concurrency, cppcoreguidelines, darwin,
						-- fuchsia, google, hicpp, linuxkernel, llvm, llvmlibc,
						-- misc, modernize, mpi, objc, openmp, performance,
						-- portability, readability, zircon

						.. ",-darwin-*"
						.. ",-linuxkernel-*"
						.. ",-llvmlibc-*"
						.. ",-objc-*"

						.. ",-altera-unroll-loops"
						.. ",-bugprone-easily-swappable-parameters"
						.. ",-fuchsia-default-arguments-calls"
						.. ",-fuchsia-default-arguments-declarations"
						.. ",-fuchsia-overloaded-operator"
						.. ",-fuchsia-trailing-return"
						.. ",-google-explicit-constructor"
						.. ",-google-readability-todo"
						.. ",-hicpp-explicit-conversions"
						.. ",-llvm-else-after-return"
						.. ",-llvm-header-guard"
						.. ",-misc-non-private-member-variables-in-classes"
						.. ",-misc-use-anonymous-namespace"
						.. ",-modernize-use-trailing-return-type"
						.. ",-readability-else-after-return"
						.. ",-readability-function-cognitive-complexity"
						.. ",-readability-identifier-length"
						.. ",-readability-isolate-declaration"
						.. ",-readability-magic-numbers"
						.. ",-readability-redundant-access-specifiers"
						.. ",-readability-redundant-inline-specifier"
						.. ",-readability-simplify-boolean-expr"

						-- .. ",-cppcoreguidelines-avoid-do-while"
						-- .. ",-cppcoreguidelines-avoid-magic-numbers"
						-- .. ",-cppcoreguidelines-non-private-member-variables-in-classes"
						-- .. ",-cppcoreguidelines-owning-memory"
						-- .. ",-cppcoreguidelines-rvalue-reference-param-not-moved"
						-- .. ",-modernize-use-nodiscard"
				})

				vim.list_extend (cppcheck.args, {
					cppcheck_standard,
					cppcheck_jnproc,
					"--check-level=exhaustive",
					"--enable=all",
					"--suppress=missingIncludeSystem",
				})
			end
		}),
		ModuleAction:new ({
			plugins = "cppman.nvim",
			action = function ()
				require ("modular.mappings.Clang.cppman_nvim")
			end
		}),
		ModuleAction:new ({
			plugins = "clangd_extensions.nvim",
			action = function ()
				require ("modular.mappings.Clang.clangd_extensions_nvim")
			end
		}),
		ModuleAction:new ({
			plugins = "insights.nvim",
			action = function ()
				require ("modular.mappings.Clang.insights_nvim")
			end
		}),
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = "compiler-explorer.nvim",
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>Ce",  "compiler explorer")

				local TreeSitters = require ("modular.config.treesitters")
				vim.list_extend (TreeSitters, { "asm" })
			end
		}),
		ModuleAction:new ({
			plugins = "compiler-explorer.nvim",
			action = function ()
				require ("modular.mappings.Clang.compiler-explorer_nvim")
			end
		}),
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = "classlayout.nvim",
			action = function ()
				require ("modular.mappings.Clang.classlayout_nvim")
			end
		}),
	}
})

return ClangModule
