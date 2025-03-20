return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"jay-babu/mason-nvim-dap.nvim",
		"williamboman/mason.nvim",
	},
	config = function ()
		require("mason-nvim-dap").setup ({
			ensure_installed = { "codelldb" }
		})
	end
}
