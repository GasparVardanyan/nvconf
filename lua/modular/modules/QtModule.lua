local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local QtModule = Module:new ({
	name = "Qt",
	actions = {
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,

			action = function ()
				local LintersByFt = require ("modular.config.linters_by_ft")

				if nil == LintersByFt ["c"]
				then
					LintersByFt ["c"] = {}
				end

				vim.list_extend (LintersByFt ["c"], {
					"clazy",
				})

				if nil == LintersByFt ["cpp"]
				then
					LintersByFt ["cpp"] = {}
				end

				vim.list_extend (LintersByFt ["cpp"], {
					"clazy",
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

				local clazy = require ("lint.linters.clazy")

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
			end
		}),
		-- ModuleAction:new ({
		-- 	event = ModuleAction.EventType.Pre,
		-- 	plugins = "none-ls.nvim",
		-- 	action = function ()
		-- 		local NoneLSAdapters = require ("modular.config.nonels_adapters")
		-- 		vim.list_extend (NoneLSAdapters, {
		-- 			function ()
		-- 				return require ("null-ls").builtins.diagnostics.clazy.with ({
		-- 					extra_args = { "-checks=level0,level1,level2,assert-with-side-effects,compare-member-check,container-inside-loop,detaching-member,heap-allocated-small-trivial-type,ifndef-define-typo,isempty-vs-count,jni-signatures,qbytearray-conversion-to-c-style,qhash-with-char-pointer-key,qproperty-type-mismatch,qrequiredresult-candidates,qstring-ref,qstring-varargs,qt-keyword-emit,qt-keywords,qvariant-template-instantiation,raw-environment-function,reserve-candidates,sanitize-inline-keyword,signal-with-return-value,thread-with-slots,tr-non-literal,unexpected-flag-enumerator-value,unneeded-cast,unused-result-check,use-arrow-operator-instead-of-data,use-chrono-in-qtimer,used-qunused-variable" },
		-- 				})
		-- 			end
		-- 		})
		-- 	end
		-- })
	}
})

return QtModule
