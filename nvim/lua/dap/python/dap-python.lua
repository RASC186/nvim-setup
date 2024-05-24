local dap_python_main = "dap-python"

local dap_python_tag = nil

local dap_python_url = "https://github.com/mfussenegger/nvim-dap-python"

local dap_python_dependencies = nil

local dap_python_lazy = false

local dap_python_cmd = nil

local dap_python_events = nil

local dap_python_priority = 1

local dap_python_opts = nil

local dap_python_keymaps = function(_, _) end

local dap_python_config = function(plugin, opts)
	dap_python_keymaps(plugin, opts)
	local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
	require(plugin.main).setup(path)
end

return {
	main = dap_python_main,
	tag = dap_python_tag,
	url = dap_python_url,
	dependencies = dap_python_dependencies,
	lazy = dap_python_lazy,
	cmd = dap_python_cmd,
	events = dap_python_events,
	priority = dap_python_priority,
	opts = dap_python_opts,
	config = dap_python_config,
}
