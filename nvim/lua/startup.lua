---@diagnostic disable: lowercase-global
--------------------------------------------------------------------------------

-- Comment

comment_main = "Comment"

comment_tag = nil

comment_url = "https://github.com/numToStr/Comment.nvim"

comment_dependencies = nil

comment_lazy = false

comment_cmd = nil

comment_events = nil

comment_priority = 1

--------------------------------------------------------------------------------

-- Autopairs

nvim_autopairs_main = "nvim-autopairs"

nvim_autopairs_tag = nil

nvim_autopairs_url = "https://github.com/windwp/nvim-autopairs"

nvim_autopairs_dependencies = nil

nvim_autopairs_lazy = false

nvim_autopairs_cmd = nil

nvim_autopairs_events = nil

nvim_autopairs_priority = 1

--------------------------------------------------------------------------------

-- Pencil

vim_pencil_main = nil

vim_pencil_tag = nil

vim_pencil_url = "https://github.com/preservim/vim-pencil.git"

vim_pencil_dependencies = nil

vim_pencil_lazy = true

vim_pencil_cmd = {
	"Pencil",
	"NoPencil",
	"PencilOff",
	"TogglePencil",
	"PencilToggle",
	"SoftPencil",
	"PencilSoft",
	"HardPencil",
	"PencilHard",
}

vim_pencil_events = nil

vim_pencil_priority = 1

--------------------------------------------------------------------------------

-- luasnip

luasnip_main = "luasnip"

luasnip_tag = "v2.3.0"

luasnip_url = "https://github.com/L3MON4D3/LuaSnip"

luasnip_dependencies = nil

luasnip_lazy = true

luasnip_cmd = nil

luasnip_events = {
	"InsertEnter",
}

luasnip_priority = 2

--------------------------------------------------------------------------------

-- cmp-vimtex

cmp_vimtex_main = "cmp_vimtex"

cmp_vimtex_tag = nil

cmp_vimtex_url = "https://github.com/micangl/cmp-vimtex"

cmp_vimtex_dependencies = nil

cmp_vimtex_lazy = false

cmp_vimtex_cmd = nil

cmp_vimtex_events = nil

cmp_vimtex_priority = 1

--------------------------------------------------------------------------------

-- vimtex

vimtex_main = nil

vimtex_tag = "v2.15"

vimtex_url = "https://github.com/lervag/vimtex"

vimtex_dependencies = nil

vimtex_lazy = false

vimtex_cmd = nil

vimtex_events = nil

vimtex_priority = 1

--------------------------------------------------------------------------------

-- nvim-cmp

nvim_cmp_main = "cmp"

nvim_cmp_tag = nil

nvim_cmp_url = "https://github.com/hrsh7th/nvim-cmp"

nvim_cmp_dependencies = {
	"https://github.com/hrsh7th/cmp-nvim-lsp",
	"https://github.com/hrsh7th/cmp-buffer",
	"https://github.com/hrsh7th/cmp-path",
	"https://github.com/micangl/cmp-vimtex",
	"https://github.com/hrsh7th/cmp-cmdline",
	"https://github.com/L3MON4D3/LuaSnip",
	"https://github.com/saadparwaiz1/cmp_luasnip",
	"https://github.com/rafamadriz/friendly-snippets",
}

nvim_cmp_lazy = false

nvim_cmp_cmd = nil

nvim_cmp_events = {
	"InsertEnter",
}

nvim_cmp_priority = 1

--------------------------------------------------------------------------------

-- nvim-dap-virtual-text

nvim_dap_virtual_text_main = "nvim-dap-virtual-text"

nvim_dap_virtual_text_tag = nil

nvim_dap_virtual_text_url = "https://github.com/theHamsta/nvim-dap-virtual-text"

nvim_dap_virtual_text_dependencies = nil

nvim_dap_virtual_text_lazy = false

nvim_dap_virtual_text_cmd = {
	"DapVirtualTextEnable",
	"DapVirtualTextDisable",
	"DapVirtualTextToggle",
}

nvim_dap_virtual_text_events = {
	"VeryLazy",
}

nvim_dap_virtual_text_priority = 1

--------------------------------------------------------------------------------

-- dapui

dapui_main = "dapui"

dapui_tag = nil

dapui_url = "https://github.com/rcarriga/nvim-dap-ui"

dapui_dependencies = {
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/nvim-neotest/nvim-nio",
	"https://github.com/theHamsta/nvim-dap-virtual-text",
}

dapui_lazy = false

dapui_cmd = {
	"DapUiToggle",
}

dapui_events = {
	"VeryLazy",
}

dapui_priority = 1

--------------------------------------------------------------------------------

-- dap

dap_main = "dap"

dap_tag = nil

dap_url = "https://github.com/mfussenegger/nvim-dap"

dap_dependencies = nil

dap_lazy = false

dap_cmd = nil

dap_events = nil

dap_priority = 1

--------------------------------------------------------------------------------

-- lldebugger

lldebugger_main = "lldebugger"

lldebugger_tag = nil

lldebugger_url = "https://github.com/tomblind/local-lua-debugger-vscode"

lldebugger_dependencies = {
	"https://github.com/rcarriga/nvim-dap-ui",
}

lldebugger_lazy = false

lldebugger_cmd = nil

lldebugger_events = nil

lldebugger_priority = 1

--------------------------------------------------------------------------------

-- dap-python

dap_python_main = "dap-python"

dap_python_tag = nil

dap_python_url = "https://github.com/mfussenegger/nvim-dap-python"

dap_python_dependencies = {
	"https://github.com/rcarriga/nvim-dap-ui",
	"https://github.com/mfussenegger/nvim-dap",
}

dap_python_lazy = false

dap_python_cmd = nil

dap_python_events = nil

dap_python_priority = 1

--------------------------------------------------------------------------------

-- conform

conform_main = "conform"

conform_tag = nil

conform_url = "https://github.com/stevearc/conform.nvim"

conform_dependencies = nil

conform_lazy = false

conform_cmd = nil

conform_events = {
	"BufReadPre",
	"BufNewFile",
}

conform_priority = 1

--------------------------------------------------------------------------------

-- Gitsigns

gitsigns_main = "gitsigns"

gitsigns_tag = nil

gitsigns_url = "https://github.com/lewis6991/gitsigns.nvim"

gitsigns_dependencies = nil

gitsigns_lazy = false

gitsigns_cmd = {
	"Gitsigns",
}

gitsigns_events = nil

gitsigns_priority = 1

--------------------------------------------------------------------------------

-- nvim-lint

nvim_lint_main = "lint"

nvim_lint_tag = nil

nvim_lint_url = "https://github.com/mfussenegger/nvim-lint"

nvim_lint_dependencies = nil

nvim_lint_lazy = true

nvim_lint_cmd = nil

nvim_lint_events = {
	"BufReadPre",
	"BufNewFile",
}

nvim_lint_priority = 1

--------------------------------------------------------------------------------

-- lspconfig

lspconfig_main = "lspconfig"

lspconfig_tag = nil

lspconfig_url = "https://github.com/neovim/nvim-lspconfig"

lspconfig_dependencies = {
	"https://github.com/hrsh7th/cmp-nvim-lsp",
	{ "https://github.com/antosha417/nvim-lsp-file-operations", config = true },
}

lspconfig_lazy = false

lspconfig_cmd = {
	"LspInfo",
	"LspStart",
	"LspStop",
	"LspRestart",
}

lspconfig_events = {
	"BufReadPre",
	"BufNewFile",
}

lspconfig_priority = 1

--------------------------------------------------------------------------------

-- lspsaga

lspsaga_main = "lspsaga"

lspsaga_tag = nil

lspsaga_url = "https://github.com/nvimdev/lspsaga.nvim"

lspsaga_dependencies = {
	"nvim-treesitter/nvim-treesitter",
}

lspsaga_lazy = false

lspsaga_cmd = nil

lspsaga_events = nil

lspsaga_priority = 1

--------------------------------------------------------------------------------

-- mason-lspconfig

mason_lspconfig_main = "mason-lspconfig"

mason_lspconfig_tag = nil

mason_lspconfig_url = "https://github.com/williamboman/mason-lspconfig.nvim"

mason_lspconfig_dependencies = nil

mason_lspconfig_lazy = false

mason_lspconfig_cmd = nil

mason_lspconfig_events = nil

mason_lspconfig_priority = 2

--------------------------------------------------------------------------------

-- mason-nvim-dap

mason_nvim_dap_main = "mason-nvim-dap"

mason_nvim_dap_tag = nil

mason_nvim_dap_url = "https://github.com/jay-babu/mason-nvim-dap.nvim"

mason_nvim_dap_dependencies = {
	"williamboman/mason.nvim",
	"mfussenegger/nvim-dap",
}

mason_nvim_dap_lazy = true

mason_nvim_dap_cmd = {
	"DapInstall",
	"DapUninstall",
}

mason_nvim_dap_events = nil

mason_nvim_dap_priority = 1

--------------------------------------------------------------------------------

-- mason

mason_main = "mason"

mason_tag = nil

mason_url = "https://github.com/williamboman/mason.nvim"

mason_dependencies = {
	"https://github.com/williamboman/mason-lspconfig.nvim",
}

mason_lazy = true

mason_cmd = {
	"Mason",
}

mason_events = nil

mason_priority = 2

--------------------------------------------------------------------------------

-- nvim-treesitter

nvim_treesitter_main = "nvim-treesitter"

nvim_treesitter_tag = nil

nvim_treesitter_url = "https://github.com/nvim-treesitter/nvim-treesitter"

nvim_treesitter_dependencies = nil

nvim_treesitter_lazy = false

nvim_treesitter_cmd = {
	"TSInstall",
	"TSInstallSync",
	"TSInstallInfo",
	"TSUpdate",
	"TSUpdateSync",
	"TSUninstall",
	"TSBufEnable",
	"TSBufDisable",
	"TSBufToggle",
	"TSEnable",
	"TSDisable",
	"TSToggle",
	"TSModuleInfo",
	"TSEditQuery",
	"TSEditQueryUserAfter",
}

nvim_treesitter_events = nil

nvim_treesitter_priority = 2

--------------------------------------------------------------------------------

-- illuminate

illuminate_main = "illuminate"

illuminate_tag = nil

illuminate_url = "https://github.com/RRethy/vim-illuminate"

illuminate_dependencies = nil

illuminate_lazy = false

illuminate_cmd = {
	"IlluminatePause",
	"IlluminateResume",
	"IlluminateToggle",
	"IlluminatePauseBuf",
	"IlluminateResumeBuf",
	"IlluminateToggleBuf",
}

illuminate_events = nil

illuminate_priority = 1

--------------------------------------------------------------------------------

-- telescope

telescope_main = "telescope"

telescope_tag = "0.1.6"

telescope_url = "https://github.com/nvim-telescope/telescope.nvim"

telescope_dependencies = {
	"nvim-lua/plenary.nvim",
}

telescope_lazy = false

telescope_cmd = {
	"Telescope",
}

telescope_events = nil

telescope_priority = 1

--------------------------------------------------------------------------------

-- goyo

goyo_main = nil

goyo_tag = nil

goyo_url = "https://github.com/junegunn/goyo.vim"

goyo_dependencies = nil

goyo_lazy = false

goyo_cmd = {
	"Goyo",
}

goyo_events = nil

goyo_priority = 1

--------------------------------------------------------------------------------

-- lspkind

lspkind_main = "lspkind"

lspkind_tag = nil

lspkind_url = "https://github.com/onsails/lspkind.nvim"

lspkind_dependencies = nil

lspkind_lazy = false

lspkind_cmd = nil

lspkind_events = nil

lspkind_priority = 1

--------------------------------------------------------------------------------

-- lualine

lualine_main = "lualine"

lualine_tag = nil

lualine_url = "https://github.com/nvim-lualine/lualine.nvim"

lualine_dependencies = nil

lualine_lazy = false

lualine_cmd = nil

lualine_events = nil

lualine_priority = 1

--------------------------------------------------------------------------------

-- nvim-tree

nvim_tree_main = "nvim-tree"

nvim_tree_tag = nil

nvim_tree_url = "https://github.com/nvim-tree/nvim-tree.lua.git"

nvim_tree_dependencies = nil

nvim_tree_lazy = false

nvim_tree_cmd = nil

nvim_tree_events = nil

nvim_tree_priority = 1

--------------------------------------------------------------------------------

-- nvim-web-devicons

nvim_web_devicons_main = "nvim-web-devicons"

nvim_web_devicons_tag = nil

nvim_web_devicons_url = "https://github.com/nvim-tree/nvim-web-devicons"

nvim_web_devicons_dependencies = nil

nvim_web_devicons_lazy = false

nvim_web_devicons_cmd = nil

nvim_web_devicons_events = nil

nvim_web_devicons_priority = 1

--------------------------------------------------------------------------------

-- tokyonight

tokyonight_main = "tokyonight"

tokyonight_tag = nil

tokyonight_url = "https://github.com/folke/tokyonight.nvim"

tokyonight_dependencies = nil

tokyonight_lazy = false

tokyonight_cmd = nil

tokyonight_events = nil

tokyonight_priority = 2

--------------------------------------------------------------------------------

-- neoconf

neoconf_main = "neoconf"

neoconf_tag = nil

neoconf_url = "https://github.com/folke/neoconf.nvim"

neoconf_dependencies = nil

neoconf_lazy = false

neoconf_cmd = {
	"Neoconf",
}

neoconf_events = nil

neoconf_priority = 3

--------------------------------------------------------------------------------

-- neodev

neodev_main = "neodev"

neodev_tag = nil

neodev_url = "https://github.com/folke/neodev.nvim"

neodev_dependencies = nil

neodev_lazy = false

neodev_cmd = nil

neodev_events = nil

neodev_priority = 1

--------------------------------------------------------------------------------

-- plenary

plenary_main = "plenary"

plenary_tag = nil

plenary_url = "https://github.com/nvim-lua/plenary.nvim"

plenary_dependencies = nil

plenary_lazy = false

plenary_cmd = nil

plenary_events = nil

plenary_priority = 1

--------------------------------------------------------------------------------
