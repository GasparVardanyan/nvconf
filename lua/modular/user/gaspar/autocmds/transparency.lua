vim.api.nvim_create_user_command ('TT', function ()
	require'solarized-osaka.config'.extend { transparent=true }
	require'solarized-osaka.theme'.setup ()

	vim.api.nvim_set_hl (0, 'TabLine', { bg='none', ctermbg='none' })
	vim.api.nvim_set_hl (0, 'TabLine', { bg='none', ctermbg='none' })
	vim.api.nvim_set_hl (0, 'TabLineSel', { bg='none', ctermbg='none' })
	vim.api.nvim_set_hl (0, 'TabLineFill', { bg='none', ctermbg='none' })
	vim.api.nvim_set_hl (0, 'StatusLine', { bg='none', ctermbg='none' })
	vim.api.nvim_set_hl (0, 'StatusLineTerm', { bg='none', ctermbg='none' })
	vim.api.nvim_set_hl (0, 'StatusLineNC', { bg='none', ctermbg='none' })
	vim.api.nvim_set_hl (0, 'TelescopeNormal', { bg='none', ctermbg='none' })
	vim.api.nvim_set_hl (0, 'TelescopeBorder', { bg='none', ctermbg='none' })
	vim.api.nvim_set_hl (0, 'TelescopeSelection', { bg='none', ctermbg='none' })
	vim.api.nvim_set_hl (0, 'Pmenu', { bg='none', ctermbg='none' })
	vim.api.nvim_set_hl (0, 'WhichKeyNormal', { bg='none', ctermbg='none' })
	vim.api.nvim_set_hl (0, 'WhichKeyBorder', { bg='none', ctermbg='none' })
	vim.api.nvim_set_hl (0, 'WhichKeyTitle', { bg='none', ctermbg='none' })
	vim.api.nvim_set_hl (0, 'DropBarMenuNormalFloat', { bg='none', ctermbg='none' })
	vim.api.nvim_set_hl (0, 'DropBarMenuFloatBorder', { bg='none', ctermbg='none' })
	vim.api.nvim_set_hl (0, 'FloatTitle', { bg='none', ctermbg='none' })

	vim.opt.cursorline = false
	vim.opt.colorcolumn = ''
	vim.api.nvim_clear_autocmds ({ group = 'Modular_NvimCursorLineHighlight' })

end, {})
