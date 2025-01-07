return {
    {
        "mfussenegger/nvim-dap",
		lazy = true,
        -- config = function(_,_)
        --     require ("nvchad.utils").load_mappings("dap")
        -- end
    },

    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
		lazy = true,
		config = true,
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            handlers = {},
            -- ensure_installed = {
            --     "codelldb",
            -- },
        },
    },

    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
		lazy = true,
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",
        },
        config = function()
            local dap, dapui = require("dap"), require("dapui")

            dapui.setup()
			require("nvim-dap-virtual-text").setup()

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end
    },
}
