local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local QtModule = Module:new ({
	name = "Qt",
	actions = {
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = "none-ls.nvim",
			action = function ()
				local NoneLSAdapters = require ("modular.config.nonels_adapters")
				vim.list_extend (NoneLSAdapters, {
					function ()
						return require ("null-ls").builtins.diagnostics.clazy.with ({
							extra_args = { "-checks=level0,level1,level2,assert-with-side-effects,compare-member-check,container-inside-loop,detaching-member,heap-allocated-small-trivial-type,ifndef-define-typo,isempty-vs-count,jni-signatures,qbytearray-conversion-to-c-style,qhash-with-char-pointer-key,qproperty-type-mismatch,qrequiredresult-candidates,qstring-ref,qstring-varargs,qt-keyword-emit,qt-keywords,qvariant-template-instantiation,raw-environment-function,reserve-candidates,sanitize-inline-keyword,signal-with-return-value,thread-with-slots,tr-non-literal,unexpected-flag-enumerator-value,unneeded-cast,unused-result-check,use-arrow-operator-instead-of-data,use-chrono-in-qtimer,used-qunused-variable" },
						})
					end
				})
			end
		})
	}
})

return QtModule
