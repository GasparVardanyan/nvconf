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

				LintersByFt ["c"] = {
					"clangtidy",
					"cppcheck",
					"clazy",
					-- "cpplint",
				}

				LintersByFt ["cpp"] = {
					"clangtidy",
					"cppcheck",
					"clazy",
					-- "cpplint",
				}

				Formatters.formatters_by_ft ["c"] = {
					"clang-format",
				}

				Formatters.formatters_by_ft ["cpp"] = {
					"clang-format",
				}
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

				local clazy = require ("lint.linters.clazy")
				local clang_tidy = require ("lint.linters.clangtidy")
				local cppcheck = require ("lint.linters.cppcheck")

				vim.list_extend (clazy.args, {
					clang_standard,
					"-checks=" -- why * doesn't work here?
						.. "level0"
						.. ",level1"
						.. ",level2"
						.. ",assert-with-side-effects"
						.. ",compare-member-check"
						.. ",container-inside-loop"
						.. ",detaching-member"
						.. ",heap-allocated-small-trivial-type"
						.. ",ifndef-define-typo"
						.. ",isempty-vs-count"
						.. ",jni-signatures"
						.. ",qbytearray-conversion-to-c-style"
						.. ",qhash-with-char-pointer-key"
						.. ",qproperty-type-mismatch"
						.. ",qrequiredresult-candidates"
						.. ",qstring-ref"
						.. ",qstring-varargs"
						.. ",qt-keyword-emit"
						.. ",qt-keywords"
						.. ",qvariant-template-instantiation"
						.. ",raw-environment-function"
						.. ",reserve-candidates"
						.. ",sanitize-inline-keyword"
						.. ",signal-with-return-value"
						.. ",thread-with-slots"
						.. ",tr-non-literal"
						.. ",unexpected-flag-enumerator-value"
						.. ",unneeded-cast"
						.. ",unused-result-check"
						.. ",use-arrow-operator-instead-of-data"
						.. ",use-chrono-in-qtimer"
						.. ",used-qunused-variable",
				})

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
						.. ",-cppcoreguidelines-avoid-magic-numbers"
						.. ",-fuchsia-overloaded-operator"
						.. ",-llvm-else-after-return"
						.. ",-modernize-use-trailing-return-type"
						.. ",-readability-else-after-return"
						.. ",-readability-function-cognitive-complexity"
						.. ",-readability-identifier-length"
						.. ",-readability-magic-numbers"
						.. ",-readability-redundant-access-specifiers"
						.. ",-readability-redundant-inline-specifier"
						.. ",-readability-simplify-boolean-expr",
				})

				vim.list_extend (cppcheck.args, {
					cppcheck_standard,
					cppcheck_jnproc,
					"--enable=all",
					"--check-level=exhaustive",
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
