---@diagnostic disable: lowercase-global, unused-local
--------------------------------------------------------------------------------

-- neovim

opt = vim.opt

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

opt.number = true
opt.relativenumber = false
opt.termguicolors = true
opt.colorcolumn = "80"
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 10
opt.completeopt = "menuone,noinsert,noselect"

opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = false
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.mouse:append("a")
opt.clipboard:append("unnamedplus")
opt.modifiable = true
opt.encoding = "UTF-8"

--------------------------------------------------------------------------------

-- Comment

comment_opts = function(plugin, opts)
	opts.padding = true
	opts.sticky = true
	opts.ignore = nil
	opts.pre_hook = nil
	opts.post_hook = nil
end

--------------------------------------------------------------------------------

-- Autopairs

nvim_autopairs_opts = function(plugin, opts)
	opts.disable_filetype = { "TelescopePrompt", "spectre_panel" }
	opts.ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=]
	opts.disable_in_macro = true
	opts.disable_in_visualblock = false
	opts.disable_in_replace_mode = true
	opts.enable_moveright = true
	opts.enable_afterquote = true
	opts.enable_check_bracket_line = true
	opts.enable_bracket_in_quote = true
	opts.enable_abbr = false
	opts.break_undo = true
	opts.check_ts = false
	opts.map_cr = true
	opts.map_bs = true
	opts.map_c_h = false
	opts.map_c_w = false
end

--------------------------------------------------------------------------------

-- Pencil

vim_pencil_opts = nil

--------------------------------------------------------------------------------

-- luasnip

luasnip_opts = nil

--------------------------------------------------------------------------------

-- nvim-cmp

nvim_cmp_opts = function(plugin, opts)
	local cmp = require(plugin.main)
	local luasnip = require("luasnip")
	local lspkind = require("lspkind")

	opts.completion = {
		completeopt = "menu,menuone,preview,noselect",
	}

	opts.snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	}

	opts.formatting = {
		format = lspkind.cmp_format({ maxwidth = 50, ellipsis_char = "..." }),
	}

	opts.window = {
		documentation = cmp.config.window.bordered(),
	}

	opts.sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	})
end

--------------------------------------------------------------------------------

-- dapui

dapui_opts = nil

--------------------------------------------------------------------------------

-- dap

dap_opts = nil

--------------------------------------------------------------------------------

-- lldebugger

lldebugger_opts = nil

--------------------------------------------------------------------------------

-- dap-python

dap_python_opts = nil

--------------------------------------------------------------------------------

-- conform

conform_opts = function(plugin, opts)
	opts.formatters_by_ft = {
		assembly = { "asmfmt" },
		bahs = { "beautysh" },
		c = { "clang-format" },
		cmake = { "cmakelang" },
		cpp = { "clang-format" },
		java = { "google-java-format" },
		javascript = { "prettier" },
		json = { "fixjson" },
		latex = { "latexindent" },
		lua = { "stylua" },
		python = { "black" },
		sql = { "sqlfmt" },
		systemverilog = { "verible" },
		yaml = { "yamlfmt" },
	}
	opts.format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	}
end

--------------------------------------------------------------------------------

-- Gitsigns

gitsigns_opts = nil

--------------------------------------------------------------------------------

-- nvim-lint

nvim_lint_opts = nil

--------------------------------------------------------------------------------

-- lspconfig

lspconfig_opts = nil

--------------------------------------------------------------------------------

-- lspsaga

lspsaga_opts = nil

--------------------------------------------------------------------------------

-- mason-lspconfig

mason_lspconfig_opts = function(plugin, opts)
	opts.ensure_installed = {
		"asm_lsp",
		"bashls",
		"clangd",
		"neocmake",
		"cssls",
		"diagnosticls",
		"html",
		"htmx",
		"jsonls",
		"tsserver",
		"dockerls",
		"docker_compose_language_service",
		"efm",
		"ltex",
		"lua_ls",
		"autotools_ls",
		"vale_ls",
		"matlab_ls",
		"pyright",
		"rust_analyzer",
		"sqlls",
		"hydra_lsp",
		"wgsl_analyzer",
		"verible",
	}
	opts.automatic_installation = true
	opts.handlers = nil
end

--------------------------------------------------------------------------------

-- mason-nvim-dap

mason_nvim_dap_opts = function(plugin, opts)
	opts.ensure_installed = {
		"bash-debug-adapter",
		"codelldb",
		"debugpy",
	}
	opts.automatic_installation = false
	opts.handlers = nil
end

--------------------------------------------------------------------------------

-- mason

mason_opts = function(plugin, opts)
	opts.PATH = "prepend"
	opts.install_root_dir = vim.fn.stdpath("data") .. "/mason"
	opts.log_level = vim.log.levels.INFO
	opts.max_concurrent_installers = 3
	opts.registries = { "github:mason-org/mason-registry" }
	opts.providers = { "mason.providers.registry-api", "mason.providers.client" }
	opts.github = {
		download_url_template = "https://github.com/%s/releases/download/%s/%s",
	}
	opts.pip = {
		upgrade_pip = false,
	}
	opts.ui = {
		width = 0.8,
		height = 0.9,
		border = "none",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
		check_outdated_packages_on_open = true,
	}
end

--------------------------------------------------------------------------------

-- nvim-treesitter

nvim_treesitter_opts = function(plugin, opts)
	opts.ensure_installed = {
		"bash",
		"c",
		"cmake",
		"cpp",
		"css",
		"dockerfile",
		"html",
		"java",
		"javascript",
		"jsonc",
		"latex",
		"lua",
		"make",
		"markdown",
		"python",
		"query",
		"rust",
		"sql",
		"verilog",
		"vim",
		"vimdoc",
		"wgsl",
		"yaml",
		"yang",
	}
	opts.sync_install = true
	opts.auto_install = true
end

--------------------------------------------------------------------------------

-- illuminate

illuminate_opts = function(plugin, opts)
	opts.providers = { "regex", "treesitter", "lsp" }
	opts.case_insensitive_regex = false
	opts.under_cursor = true
	opts.delay = 100
	opts.min_count_to_highlight = 1
	opts.large_file_cutoff = nil
	opts.large_file_overrides = nil
	opts.should_enable = function(_)
		return true
	end
end

--------------------------------------------------------------------------------

-- telescope

telescope_opts = function(plugin, opts)
	opts.pickers = {
		find_files = {
			theme = "dropdown",
			previewer = false,
			hidden = true,
		},
		live_grep = {
			theme = "dropdown",
			previewer = true,
		},
		find_buffers = {
			theme = "dropdown",
			previewer = false,
		},
	}
end

--------------------------------------------------------------------------------

-- goyo

goyo_opts = nil

--------------------------------------------------------------------------------

-- lspkind

lspkind_opts = function(plugin, opts)
	opts.mode = "symbol_text"
	opts.preset = "codicons"
	opts.symbol_map = {
		Text = "󰉿",
		Method = "󰆧",
		Function = "󰊕",
		Constructor = "",
		Field = "󰜢",
		Variable = "󰀫",
		Class = "󰠱",
		Interface = "",
		Module = "",
		Property = "󰜢",
		Unit = "󰑭",
		Value = "󰎠",
		Enum = "",
		Keyword = "󰌋",
		Snippet = "",
		Color = "󰏘",
		File = "󰈙",
		Reference = "󰈇",
		Folder = "󰉋",
		EnumMember = "",
		Constant = "󰏿",
		Struct = "󰙅",
		Event = "",
		Operator = "󰆕",
		TypeParameter = "",
	}
end

--------------------------------------------------------------------------------

-- lualine

lualine_opts = function(plugin, opts)
	opts.options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	}
	opts.sections = {
		lualine_a = { "filename" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {},
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	}
	opts.inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	}
	opts.tabline = {}
	opts.winbar = {}
	opts.inactive_winbar = {}
	opts.extensions = {}
end

--------------------------------------------------------------------------------

-- nvim-tree

nvim_tree_opts = function(plugin, opts)
	opts.sort = {
		sorter = "case_sensitive",
	}
	opts.view = {
		width = 35,
	}
	opts.renderer = {
		group_empty = true,
	}
	opts.filters = {
		dotfiles = true,
	}
end

--------------------------------------------------------------------------------

-- nvim-web-devicons

nvim_web_devicons_opts = function(plugin, opts)
	opts.default = true
	opts.strict = true
	opts.color_icons = true
	opts.override_by_filename = {
		[".gitignore"] = {
			icon = "",
			color = "#f1502f",
			name = "Gitignore",
		},
	}
	opts.override_by_extension = {
		["log"] = {
			icon = "",
			color = "#81e043",
			name = "Log",
		},
	}
end

--------------------------------------------------------------------------------

-- tokyonight

tokyonight_opts = function(plugin, opts)
	opts.style = "night"
	opts.light_style = "day"
	opts.day_brightness = 0.3
	opts.terminal_colors = true
	opts.transparent = false
	opts.lualine_bold = false
	opts.dim_inactive = true
	opts.hide_inactive_statusline = false
	opts.sidebars = { "qf", "help" }
	opts.styles = {
		comments = { italic = true },
		keywords = { italic = false },
		functions = { italic = false },
		variables = { italic = false },
		sidebars = "dark",
		floats = "dark",
	}
end

--------------------------------------------------------------------------------

-- neoconf

neoconf_opts = function(plugin, opts)
	opts._settings = ".neoconf.json"
	opts.global_settings = "/lua/lsp/config/neoconf.json"
	opts.live_reload = true
	opts.filetype_jsonc = true
	opts.import = {
		vscode = true,
		coc = true,
		nlsp = true,
	}
	opts.plugins = {
		lspconfig = { enabled = true },
		jsonls = { enabled = true, configured_servers_only = true },
		lua_ls = { enabled_for_neovim_config = true, enabled = false },
	}
end

--------------------------------------------------------------------------------

-- neodev

neodev_opts = nil

--------------------------------------------------------------------------------

-- plenary

plenary_opts = nil

--------------------------------------------------------------------------------
