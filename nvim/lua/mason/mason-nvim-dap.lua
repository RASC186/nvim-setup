local mason_nvim_dap_main = "mason-nvim-dap"

local mason_nvim_dap_tag = nil

local mason_nvim_dap_url = "https://github.com/jay-babu/mason-nvim-dap.nvim"

local mason_nvim_dap_dependencies = {
	"williamboman/mason.nvim",
	"mfussenegger/nvim-dap",
}

local mason_nvim_dap_lazy = true

local mason_nvim_dap_cmd = {
	"DapInstall",
	"DapUninstall",
}

local mason_nvim_dap_events = nil

local mason_nvim_dap_priority = 1
