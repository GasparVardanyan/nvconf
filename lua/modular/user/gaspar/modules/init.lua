local modular_modules = {}

local hostname = vim.fn.hostname ()

if 1 == hostname:find ("work")
then
	modular_modules = vim.tbl_deep_extend ("error", require ("modular.modules"), {
		menu_module = require ("modular.modules._MenuModule"),
	})
else
	modular_modules = {
		-- ai_module = require ("modular.modules.AiModule"),
		basic_module = require ("modular.modules.BasicModule"),
		clang_module = require ("modular.modules.ClangModule"),
		compiler_module = require ("modular.modules.CompilerModule"),
		-- dap_module = require ("modular.modules.DapModule"),
		-- db_module = require ("modular.modules.DbModule"),
		-- gdb_module = require ("modular.modules.GdbModule"),
		git_module = require ("modular.modules.GitModule"),
		-- lean_module = require ("modular.modules.LeanModule"),
		-- lint_module = require ("modular.modules.LintModule"),
		lsp_module = require ("modular.modules.LspModule"),
		lspnativecompletion_module = require ("modular.modules.LspNativeCompletionModule"),
		md_module = require ("modular.modules.MdModule"),
		misc_module = require ("modular.modules.MiscModule"),
		nvim_module = require ("modular.modules.NvimModule"),
		org_module = require ("modular.modules.OrgModule"),
		-- rest_module = require ("modular.modules.RestModule"),
		-- test_module = require ("modular.modules.TestModule"),
		ui_module = require ("modular.modules.UIModule"),
	}
end

local gaspar_modules = {
	custom_module = require ("modular.user.gaspar.modules.CustomModule")
}

local modules = vim.tbl_deep_extend (
	"error",
	modular_modules,
	gaspar_modules
)

return modules
