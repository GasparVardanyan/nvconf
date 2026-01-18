vim.diagnostic.config {
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = vim.diagnostic.severity.ERROR },
	signs = vim.g.have_nerd_font and {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	} or {},
	virtual_text = {
		source = "if_many",
		spacing = 2,
		format = function(diagnostic)
			local diagnostic_message = {
				[vim.diagnostic.severity.ERROR] = diagnostic.message,
				[vim.diagnostic.severity.WARN] = diagnostic.message,
				[vim.diagnostic.severity.INFO] = diagnostic.message,
				[vim.diagnostic.severity.HINT] = diagnostic.message,
			}
			return diagnostic_message[diagnostic.severity]
		end,
	},
	virtual_lines = { current_line = true },
}

vim.api.nvim_create_autocmd ("InsertEnter", {
	pattern = "*",
	callback = function ()
		vim.diagnostic.config ({
			virtual_text = false,
		})
	end
})

vim.api.nvim_create_autocmd ("InsertLeave", {
	pattern = "*",
	callback = function ()
		vim.diagnostic.config ({
			virtual_text = true,
		})
	end
})
