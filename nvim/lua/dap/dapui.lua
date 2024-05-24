local dapui_main = "dapui"

local dapui_tag = nil

local dapui_url = "https://github.com/rcarriga/nvim-dap-ui"

local dapui_dependencies = nil

local dapui_lazy = false

local dapui_cmd = nil

local dapui_events = nil

local dapui_priority = 1

local dapui_opts = function(_, opts)
	opts.sidebars = {
		elements = {
			"scopes",
			"scopes",
			"watches",
		},
		width = 40,
		position = "left",
	}
	opts.tray = {
		elements = {
			"repl",
		},
		height = 10,
		position = "bottom",
	}
end

local dapui_keymaps = function(_, _)
	vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require('dapui').open({reset=true})<CR><ESC>", {})
	vim.api.nvim_set_keymap("n", "<leader>dt", ":lua require('dapui').toggle({reset=true})<CR><ESC>", {})
	vim.api.nvim_set_keymap("n", "<leader>dq", ":lua require('dapui').close()<CR><ESC>", {})
end

local dapui_config = function(plugin, opts)
	dapui_keymaps(plugin, opts)
	local dapui = require(plugin.main)
	local dap = require("dap")
	dapui.setup(opts)
	dap.listeners.after.event_initialized["dapui_config"] = function()
		require("dapui").open()
	end
end

return {
	main = dapui_main,
	tag = dapui_tag,
	url = dapui_url,
	dependencies = dapui_dependencies,
	lazy = dapui_lazy,
	cmd = dapui_cmd,
	events = dapui_events,
	priority = dapui_priority,
	opts = dapui_opts,
	config = dapui_config,
}
