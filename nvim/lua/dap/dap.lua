local dap_main = "dap"

local dap_tag = nil

local dap_url = "https://github.com/mfussenegger/nvim-dap"

local dap_dependencies = nil

local dap_lazy = false

local dap_cmd = nil

local dap_events = nil

local dap_priority = 1

local dap_opts = nil

local dap_keymaps = function(plugin, _)
	local dap = require(plugin.main)
	vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
	vim.keymap.set("n", "<leader>dc", dap.continue)
	vim.keymap.set("n", "<leader>dn", dap.step_over)
	vim.keymap.set("n", "<leader>di", dap.step_into)
	vim.keymap.set("n", "<leader>dp", dap.step_back)
	vim.keymap.set("n", "<leader>dd", function()
		dap.disconnect()
		dap.close()
	end, {})
end

local dap_config = function(plugin, opts)
	dap_keymaps(plugin, opts)

	local dap = require(plugin.main)

	dap.adapters.bashdb = {
		type = "executable",
		command = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/bash-debug-adapter",
		name = "bashdb",
	}

	dap.adapters.codelldb = {
		type = "server",
		port = "${port}",
		executable = {
			command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/codelldb",
			args = { "--port", "${port}" },
		},
	}

	dap.adapters.python = function(cb, config)
		if config.request == "attach" then
			local port = (config.connect or config).port
			local host = (config.connect or config).host or "127.0.0.1"
			cb({
				type = "server",
				port = assert(port, "`connect.port` is required for a python `attach` configuration"),
				host = host,
				options = {
					source_filetype = "python",
				},
			})
		else
			cb({
				type = "executable",
				command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python",
				args = { "-m", "debugpy.adapter" },
				options = {
					source_filetype = "python",
				},
			})
		end
	end

	dap.configurations.sh = {
		{
			type = "bashdb",
			request = "launch",
			name = "Launch file",
			showDebugOutput = true,
			pathBashdb = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb",
			pathBashdbLib = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir",
			trace = true,
			file = "${file}",
			program = "${file}",
			cwd = "${workspaceFolder}",
			pathCat = "cat",
			pathBash = "/bin/bash",
			pathMkfifo = "mkfifo",
			pathPkill = "pkill",
			args = {},
			env = {},
			terminalKind = "integrated",
		},
	}

	dap.configurations.c = {
		{
			name = "Launch file",
			type = "codelldb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
		},
	}

	dap.configurations.cpp = dap.configurations.c

	dap.configurations.python = {
		{
			type = "python",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			pythonPath = function()
				local cwd = vim.fn.getcwd()
				if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
					return cwd .. "/venv/bin/python"
				elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
					return cwd .. "/.venv/bin/python"
				else
					return "/usr/bin/python"
				end
			end,
		},
	}
end

return {
	main = dap_main,
	tag = dap_tag,
	url = dap_url,
	dependencies = dap_dependencies,
	lazy = dap_lazy,
	cmd = dap_cmd,
	events = dap_events,
	priority = dap_priority,
	opts = dap_opts,
	config = dap_config,
}
