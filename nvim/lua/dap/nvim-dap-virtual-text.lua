local nvim_dap_virtual_text_main = "nvim-dap-virtual-text"

local nvim_dap_virtual_text_tag = nil

local nvim_dap_virtual_text_url = "https://github.com/theHamsta/nvim-dap-virtual-text"

local nvim_dap_virtual_text_dependencies = nil

local nvim_dap_virtual_text_lazy = false

local nvim_dap_virtual_text_cmd = {
	"DapVirtualTextEnable",
	"DapVirtualTextDisable",
	"DapVirtualTextToggle",
}

local nvim_dap_virtual_text_events = nil

local nvim_dap_virtual_text_priority = 1

local nvim_dap_virtual_text_opts = function(_, opts)
	opts.enabled = true
	opts.enabled_commands = true
	opts.highlight_changed_variables = true
	opts.show_stop_reason = true
	opts.commented = false
	opts.only_first_definition = true
	opts.all_references = false
	opts.clear_on_continue = false
	opts.display_callback = function(variable, options)
		if options.virt_text_pos == "inline" then
			return " = " .. variable.value
		else
			return variable.name .. " = " .. variable.value
		end
	end
	opts.virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol"
	opts.all_frames = false
	opts.virt_lines = false
	opts.virt_text_win_col = nil
end

local nvim_dap_virtual_text_keymaps = function(_, _) end

local nvim_dap_virtual_text_config = function(plugin, opts)
	nvim_dap_virtual_text_keymaps(plugin, opts)
	local nvim_dap_virtual_text = require(plugin.main)
	nvim_dap_virtual_text.setup(opts)
end

return {
	main = nvim_dap_virtual_text_main,
	tag = nvim_dap_virtual_text_tag,
	url = nvim_dap_virtual_text_url,
	dependencies = nvim_dap_virtual_text_dependencies,
	lazy = nvim_dap_virtual_text_lazy,
	cmd = nvim_dap_virtual_text_cmd,
	events = nvim_dap_virtual_text_events,
	priority = nvim_dap_virtual_text_priority,
	opts = nvim_dap_virtual_text_opts,
	config = nvim_dap_virtual_text_config,
}
