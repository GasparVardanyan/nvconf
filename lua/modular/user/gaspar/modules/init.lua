local modular_modules = {}

local hostname = vim.fn.hostname ()

if 1 == hostname:find ("work")
then
	modular_modules = require ("modular.modules")
else
	modular_modules = {
		ui_module = require ("modular.modules.UIModule"),
		basic_module = require ("modular.modules.BasicModule"),
		misc_module = require ("modular.modules.MiscModule"),
		git_module = require ("modular.modules.GitModule"),
		nvim_module = require ("modular.modules.NvimModule"),
		org_module = require ("modular.modules.OrgModule"),
		-- compiler_module = require ("modular.modules.CompilerModule"),
		-- dap_module = require ("modular.modules.DapModule"),
		-- db_module = require ("modular.modules.DbModule"),
		md_module = require ("modular.modules.MdModule"),
		lsp_module = require ("modular.modules.LspModule"),
		lsp_native_completion_module = require ("modular.modules.LspNativeCompletionModule"),
		-- lsp_nvim_cmp_completion_module = require ("modular.extras.modules._LspNvimCmpCompletionModule"),
		-- lean_module = require ("modular.extras.modules.LeanModule"),
		-- clang_module = require ("modular.extras.modules.ClangModule"),
		-- gdb_module = require ("modular.extras.modules.GdbModule"),
		-- menu_module = require ("modular.extras.modules.MenuModule"),
		-- ai_module = require ("modular.modules.AiModule"),
		-- test_module = require ("modular.modules.TestModule"),
		-- rest_module = require ("modular.modules.RestModule"),
		-- lint_module = require ("modular.modules.LintModule")
		-- lspsaga_module = require ("modular.extras.modules.LspSagaModule"),
		-- temporary_module1 = require ("modular.modules.TemporaryModule1"),
	}
end

local gaspar_modules = {
	custom_module = require ("modular.user.gaspar.modules.CustomModule")
}

local modules = vim.tbl_extend (
	"error",
	modular_modules,
	gaspar_modules
)

return modules
