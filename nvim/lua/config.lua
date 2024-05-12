---@diagnostic disable: lowercase-global
--------------------------------------------------------------------------------

require("keymaps")

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

-- Spectre

spectre_config = function(plugin, opts)
	spectre_keymaps(plugin, opts)
	require(plugin.main).setup(opts)
end

--------------------------------------------------------------------------------

-- Pencil

vim_pencil_config = function(plugin, opts)
	vim_pencil_keymaps(plugin, opts)
end

--------------------------------------------------------------------------------

-- nvim-cmp

nvim_cmp_config = function(plugin, opts)
	nvim_cmp_keymaps(plugin, opts)
	require(plugin.main).setup(opts)
end

--------------------------------------------------------------------------------

-- dap

dap_config = function(plugin, opts)
	dap_keymaps(plugin, opts)
	plugin.adapters.gdb = {
		type = "executable",
		command = "gdb",
		args = { "-i", "dap" },
	}
	plugin.configurations.c = {
		{
			name = "Launch",
			type = "gdb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopAtBeginningOfMainSubprogram = false,
		},
	}
end

--------------------------------------------------------------------------------

-- conform

conform_config = function(plugin, opts)
	conform_keymaps(plugin, opts)
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
	plugin.linters_by_ft = {
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
		python = { "flake8", "pydocstyle" },
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
		opts = { noremap = true, silent = false, buffer = bufnr }

		vim.keymap.set("n", "<A-a>", ":lua vim.lsp.buf.code_action()<CR>", opts)
		vim.keymap.set("n", "<A-k>", ":lua vim.lsp.buf.hover()<CR>", opts)
		vim.keymap.set("n", "<A-d>", ":lua vim.lsp.buf.definition()<CR>", opts)
		vim.keymap.set("n", "<A-i>", ":lua vim.lsp.buf.implementation()<CR>", opts)
		vim.keymap.set("n", "<A-r>", ":lua vim.lsp.buf.rename()<CR>", opts)
		vim.keymap.set("n", "<A-CR>", vim.diagnostic.open_float, opts)
	end

	local signs = { Error = "󰅙 ", Warn = " ", Hint = "󰠠 ", Info = "󰋗 " }

	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	lspconfig["lua_ls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			-- custom setting for lua
			Lua = {
				-- make the language server recognize "vim" global
				diagnostics = {
					globals = { "vim" },
				},
			},
			workspace = {
				-- make language server aware of runtime files
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

	--  luacheck = require("efmls-configs.linters.luacheck")
	--  stylua = require("efmls-configs.formatters.stylua")
	--  flake8 = require("efmls-configs.linters.flake8")
	--  black = require("efmls-configs.formatters.black")
	--
	-- -- configure efm server
	-- lspconfig.efm.setup({
	-- 	filetypes = {
	-- 		"lua",
	-- 		"python",
	-- 	},
	-- 	init_options = {
	-- 		documentFormatting = true,
	-- 		documentRangFormatting = true,
	-- 		houver = true,
	-- 		documentSymbol = true,
	-- 		codeAction = true,
	-- 		completion = true,
	-- 	},
	-- 	settings = {
	-- 		languages = {
	-- 			lua = { luacheck, stylua },
	-- 			python = { flake8, black },
	-- 		},
	-- 	},
	-- })
	--
	--  lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
	-- vim.api.nvim_create_autocmd("BufWritePost", {
	-- 	group = lsp_fmt_group,
	-- 	callback = function()
	-- 		 efm = vim.lsp.get_active_clients({ name = "efm" })
	--
	-- 		if vim.tbl_isempty(efm) then
	-- 			return
	-- 		end
	--
	-- 		vim.lsp.buf.format({ name = "efm" })
	-- 	end,
	-- })
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

-- mason

mason_config = function(plugin, opts)
	mason_keymaps(plugin, opts)
	require(plugin.main).setup(opts)
end

--------------------------------------------------------------------------------

-- nvim-treesitter

nvim_treesitter_config = function(plugin, opts)
	nvim_treesitter_keymaps(plugin, opts)
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
end

--------------------------------------------------------------------------------

-- plenary

plenary_config = function(plugin, opts)
	plenary_keymaps(plugin, opts)
end

--------------------------------------------------------------------------------
