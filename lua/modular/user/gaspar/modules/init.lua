local modular_modules = {}
local gaspar_modules = {}

local hostname = vim.fn.hostname ()

if 1 == hostname:find ("devenv")
then
	-- modular_modules = vim.tbl_deep_extend ("error", require ("modular.modules"), {
	-- 	menu_module = require ("modular.modules._MenuModule"),
	-- })
	modular_modules = require ("modular.modules")
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
