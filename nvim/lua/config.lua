---@diagnostic disable: lowercase-global, unused-local
--------------------------------------------------------------------------------

require("keymaps")
require("autocmds")

--------------------------------------------------------------------------------

-- Comment

comment_config = function(plugin, opts)
	comment_keymaps(plugin, opts)
	require(plugin.main).setup(opts)
end

--------------------------------------------------------------------------------

-- Autopairs

nvim_autopairs_config = function(plugin, opts)
	nvim_autopairs_keymaps(plugin, opts)
	require(plugin.main).setup(opts)
end

--------------------------------------------------------------------------------

-- Pencil

vim_pencil_config = function(plugin, opts)
	vim_pencil_keymaps(plugin, opts)
end

--------------------------------------------------------------------------------

-- luasnip

luasnip_config = function(plugin, opts)
	require("luasnip/loaders/from_vscode").lazy_load()
	luasnip_keymaps(plugin, opts)
	local luasnip = require(plugin.main)
	local types = require(plugin.main .. ".util.types")
	luasnip.config.set_config = {
		history = true,
		updateevents = "TextChanged,TextChangedI",
		enable_autosnippets = true,
		ext_opts = {
			[types.choiceNode] = {
				active = {
					virt_text = { { "<-", "Error" } },
				},
			},
		},
	}
end

--------------------------------------------------------------------------------

-- cmp-vimtex

cmp_vimtex_config = function(plugin, opts)
	cmp_vimtex_keymaps(plugin, opts)
	require(plugin.main).setup()
end

--------------------------------------------------------------------------------

-- vimtex

vimtex_config = function(plugin, opts)
	vim.g.vimtex_view_method = "zathura_simple"
	vim.g.vimtex_syntax_enabled = 0
	vim.g.vimtex_quickfix_mode = 1
	vim.g.vimtex_mappings_enabled = 1
	vim.g.vimtex_indent_enabled = 1
	vim.g.tex_flavor = "latex"
	vim.g.tex_indent_items = 1
	vim.g.tex_indent_brace = 1
	vim.g.vimtex_context_pdf_viewer = "okular"
	vim.g.rvimtex_log_ignore = {
		"Underfull",
		"Overfull",
		"specifier changed to",
		"Token not allowed in a PDF string",
	}
end

--------------------------------------------------------------------------------

-- nvim-cmp

nvim_cmp_config = function(plugin, opts)
	nvim_cmp_keymaps(plugin, opts)
	require(plugin.main).setup(opts)
end

--------------------------------------------------------------------------------

-- nvim_dap_virtual_text

nvim_dap_virtual_text_config = function(plugin, opts)
	nvim_dap_virtual_text_keymaps(plugin, opts)
	local nvim_dap_virtual_text = require(plugin.main)
	nvim_dap_virtual_text.setup(opts)
end

--------------------------------------------------------------------------------

-- dapui

dapui_config = function(plugin, opts)
	dapui_keymaps(plugin, opts)
	local dapui = require(plugin.main)
	local dap = require("dap")
	dapui.setup(opts)
	dap.listeners.after.event_initialized["dapui_config"] = function()
		require("dapui").open()
	end
end

--------------------------------------------------------------------------------

-- dap

dap_config = function(plugin, opts)
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
			---@diagnostic disable-next-line: undefined-field
			local port = (config.connect or config).port
			---@diagnostic disable-next-line: undefined-field
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

--------------------------------------------------------------------------------

-- lldebugger

lldebugger_config = function(_, _) end

--------------------------------------------------------------------------------

-- dap-python

dap_python_config = function(plugin, opts)
	dap_python_keymaps(plugin, opts)
	local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
	require(plugin.main).setup(path)
end

--------------------------------------------------------------------------------

-- conform

conform_config = function(plugin, opts)
	conform_keymaps(plugin, opts)
	conform_autocmds(plugin, opts)
	require(plugin.main).setup(opts)
end

--------------------------------------------------------------------------------

-- Git

gitsigns_config = function(plugin, opts)
	gitsigns_keymaps(plugin, opts)
	require(plugin.main).setup(opts)
end

--------------------------------------------------------------------------------

-- nvim-lint

nvim_lint_config = function(plugin, opts)
	nvim_lint_keymaps(plugin, opts)
	nvim_lint_autocmds(plugin, opts)
	local lint = require(plugin.main)
	lint.linters_by_ft = {
		bash = { "shellcheck" },
		cmake = { "cmakelang", "cmakelint" },
		cpp = { "cpplint" },
		docker = { "hadolint" },
		html = { "htmlhint" },
		java = { "checkstyle" },
		javascript = { "eslint_d" },
		make = { "checkmake" },
		json = { "jsonlint" },
		latex = { "vale" },
		lua = { "luacheck" },
		markdown = { "vale", "write-good", "misspell" },
		python = { "flake8", "mypy", "pylint" },
		sql = { "sqlfluff" },
		systemverilog = { "verible" },
		yaml = { "yamllint" },
	}
end

--------------------------------------------------------------------------------

-- lspconfig

lspconfig_config = function(plugin, opts)
	lspconfig_keymaps(plugin, opts)

	local lspconfig = require("lspconfig")
	local cmp_nvim_lsp = require("cmp_nvim_lsp")

	local capabilities = cmp_nvim_lsp.default_capabilities()

	local on_attach = function(_, bufnr)
		local options = { noremap = true, silent = false, buffer = bufnr }

		vim.keymap.set("n", "<A-a>", ":lua vim.lsp.buf.code_action()<CR>", options)
		vim.keymap.set("n", "<A-k>", ":lua vim.lsp.buf.hover()<CR>", options)
		vim.keymap.set("n", "<A-d>", ":lua vim.lsp.buf.definition()<CR>", options)
		vim.keymap.set("n", "<A-D>", ":lua vim.lsp.buf.declaration()<CR>", options)
		vim.keymap.set("n", "<A-i>", ":lua vim.lsp.buf.implementation()<CR>", options)
		vim.keymap.set("n", "<A-r>", ":lua vim.lsp.buf.rename()<CR>", options)
		vim.keymap.set("n", "<A-CR>", vim.diagnostic.open_float, options)
	end

	local signs = { Error = "󰅙 ", Warn = " ", Hint = "󰠠 ", Info = "󰋗 " }

	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	lspconfig["bashls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	lspconfig["clangd"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	lspconfig["dockerls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	lspconfig["docker_compose_language_service"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	lspconfig["ltex"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		root_dir = function()
			return vim.fn.stdpath("data") .. "/mason/packages/ltex-ls/ltex-ls-16.0.0/bin"
		end,
	})

	lspconfig["lua_ls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
			workspace = {
				libary = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "../lua"] = true,
				},
			},
		},
	})

	lspconfig["pyright"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})
end

--------------------------------------------------------------------------------

-- lspsaga

lspsaga_config = function(plugin, opts)
	lspsaga_keymaps(plugin, opts)
end

--------------------------------------------------------------------------------

-- mason-lspconfig

mason_lspconfig_config = function(plugin, opts)
	mason_lspconfig_keymaps(plugin, opts)
	require(plugin.main).setup(opts)
end

--------------------------------------------------------------------------------

-- mason-nvim-dap

mason_nvim_dap_config = function(plugin, opts)
	mason_nvim_dap_keymaps(plugin, opts)
	require(plugin.main).setup(opts)
end

--------------------------------------------------------------------------------

-- mason

mason_config = function(plugin, opts)
	mason_keymaps(plugin, opts)
	require(plugin.main).setup(opts)
end

--------------------------------------------------------------------------------

-- nvim-treesitter

nvim_treesitter_config = function(plugin, opts)
	nvim_treesitter_keymaps(plugin, opts)
	nvim_treesitter_autocmds(plugin, opts)
	require(plugin.main).setup(opts)
end

--------------------------------------------------------------------------------

-- illuminate

illuminate_config = function(plugin, opts)
	illuminate_keymaps(plugin, opts)
	require(plugin.main).configure(opts)
end

--------------------------------------------------------------------------------

-- telescope

telescope_config = function(plugin, opts)
	telescope_keymaps(plugin, opts)
	require(plugin.main).setup(opts)
end

--------------------------------------------------------------------------------

-- goyo

goyo_config = function(plugin, opts)
	goyo_keymaps(plugin, opts)
end

--------------------------------------------------------------------------------

-- lspkind

lspkind_config = function(plugin, opts)
	lspkind_keymaps(plugin, opts)
	require(plugin.main).init(opts)
end

--------------------------------------------------------------------------------

-- lualine

lualine_config = function(plugin, opts)
	lualine_keymaps(plugin, opts)
	require(plugin.main).setup(opts)
end

--------------------------------------------------------------------------------

-- nvim-tree

nvim_tree_config = function(plugin, opts)
	nvim_tree_keymaps(plugin, opts)
	require(plugin.main).setup(opts)
end

--------------------------------------------------------------------------------

-- nvim-web-devicons

nvim_web_devicons_config = function(plugin, opts)
	nvim_web_devicons_keymaps(plugin, opts)
	require(plugin.main).setup(opts)
end

--------------------------------------------------------------------------------

-- tokyonight

tokyonight_config = function(plugin, opts)
	tokyonight_keymaps(plugin, opts)
	require(plugin.main).setup(opts)
	vim.cmd([[colorscheme tokyonight]])
end

--------------------------------------------------------------------------------

-- neoconf

neoconf_config = function(plugin, opts)
	neoconf_keymaps(plugin, opts)
	require(plugin.main).setup(opts)
end

--------------------------------------------------------------------------------

-- neodev

neodev_config = function(plugin, opts)
	neoconf_keymaps(plugin, opts)
	local neodev = require(plugin.main)
	neodev.setup(opts)
end

--------------------------------------------------------------------------------

-- plenary

plenary_config = function(plugin, opts)
	plenary_keymaps(plugin, opts)
end

--------------------------------------------------------------------------------
