return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			require("nvim-dap-virtual-text").setup()

			-- DAP UI setup
			dapui.setup()

			-- Open/close UI automatically
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- Keybindings for debugging
			vim.keymap.set("n", "<F5>", function()
				vim.cmd("wall") -- Save all buffers
				require("dap").continue()
			end, { noremap = true, silent = true })
			-- vim.keymap.set("n", "<F5>", dap.continue, { noremap = true, silent = true })
			vim.keymap.set("n", "<F6>", dap.step_over, { noremap = true, silent = true })
			vim.keymap.set("n", "<F7>", dap.step_into, { noremap = true, silent = true })
			vim.keymap.set("n", "<F8>", dap.step_out, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>B", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>lp", function()
				dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>dr", dap.repl.open, { noremap = true, silent = true })
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		---@type MasonNvimDapSettings
		opts = {
			-- This line is essential to making automatic installation work
			-- :exploding-brain
			handlers = {},
			automatic_installation = {
				-- These will be configured by separate plugins.
				exclude = {
					"delve",
					"python",
				},
			},
			-- DAP servers: Mason will be invoked to install these if necessary.
			ensure_installed = {
				"bash",
				"codelldb",
				"php",
				"python",
				"delve",
			},
		},
		dependencies = {
			"mfussenegger/nvim-dap",
			"williamboman/mason.nvim",
		},
	},
	{
		"mfussenegger/nvim-dap-python",
		lazy = true,
		config = function()
			require("dap-python").setup("debugpy-adapter")
			require("dap-python").test_runner = "pytest"
		end,
		-- Consider the mappings at
		-- https://github.com/mfussenegger/nvim-dap-python?tab=readme-ov-file#mappings
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},
	{
		"leoluz/nvim-dap-go",
		config = function()
			require("dap-go").setup()
		end,
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},
}
