local modular_modules = {}
local gaspar_modules = {}

local hostname = vim.fn.hostname ()

if 1 == hostname:find ("devenv")
then
	-- modular_modules = require ("modular.modules")
	modular_modules = {
		menu_module = require ("modular.modules._MenuModule"),
		-- ai_module = require ("modular.modules.AiModule"),
		autocomplete_module = require ("modular.modules.AutoCompleteModule"),
		basic_module = require ("modular.modules.BasicModule"),
		clang_module = require ("modular.modules.ClangModule"),
		compiler_module = require ("modular.modules.CompilerModule"),
		dap_module = require ("modular.modules.DapModule"),
		-- db_module = require ("modular.modules.DbModule"),
		doc_module = require ("modular.modules.DocModule"),
		-- formatter_module = require ("modular.modules.FormatterModule"),
		-- gdb_module = require ("modular.modules.GdbModule"),
		git_module = require ("modular.modules.GitModule"),
		-- github_module = require ("modular.modules.GithubModule"),
		-- iron_module = require ("modular.modules.IronModule"),
		-- java_module = require ("modular.modules.JavaMoule"),
		-- lean_module = require ("modular.modules.LeanModule"),
		lint_module = require ("modular.modules.LintModule"),
		lsp_module = require ("modular.modules.LspModule"),
		lspsaga_module = require ("modular.modules.LspSagaModule"),
		md_module = require ("modular.modules.MdModule"),
		misc_module = require ("modular.modules.MiscModule"),
		-- nonels_module = require ("modular.modules.NoneLSModule"),
		-- nvim_module = require ("modular.modules.NvimModule"),
		org_module = require ("modular.modules.OrgModule"),
		-- profiler_module = require ("modular.modules.ProfilerModule"),
		-- qt_module = require ("modular.modules.QtModule"),
		-- rest_module = require ("modular.modules.RestModule"),
		session_module = require ("modular.modules.SessionModule"),
		test_module = require ("modular.modules.TestModule"),
		ui_module = require ("modular.modules.UIModule"),
	}
	gaspar_modules = vim.tbl_deep_extend (
		"error",
		gaspar_modules,
		{
			dev_module = require ("modular.user.gaspar.modules.DevModule"),
		}
	)
else
	modular_modules = {
		autocomplete_module = require ("modular.modules.AutoCompleteModule"),
		basic_module = require ("modular.modules.BasicModule"),
		git_module = require ("modular.modules.GitModule"),
		lsp_module = require ("modular.modules.LspModule"),
		md_module = require ("modular.modules.MdModule"),
		misc_module = require ("modular.modules.MiscModule"),
		nvim_module = require ("modular.modules.NvimModule"),
		org_module = require ("modular.modules.OrgModule"),
		session_module = require ("modular.modules.SessionModule"),
		ui_module = require ("modular.modules.UIModule"),
	}
end

gaspar_modules = vim.tbl_deep_extend (
	"error",
	gaspar_modules,
	{
		custom_module = require ("modular.user.gaspar.modules.CustomModule"),
	}
)

local modules = vim.tbl_deep_extend (
	"error",
	modular_modules,
	gaspar_modules
)

return modules
