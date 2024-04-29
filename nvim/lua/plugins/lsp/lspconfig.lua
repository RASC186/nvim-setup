local url = "https://github.com/neovim/nvim-lspconfig"

local main = "lspconfig"

-- local cmd = {}

local event = { "BufReadPre" , "BufNewFile" }

local priority = 1

local lazy = false

local enabled = true

local dependencies = {
  "https://github.com/hrsh7th/cmp-nvim-lsp",
  {"https://github.com/antosha417/nvim-lsp-file-operations", config = true }
}

-- local opts = {}

local config = function()

  local lspconfig = require("lspconfig")
  local cmp_nvim_lsp = require("cmp_nvim_lsp")

  local capabilities = cmp_nvim_lsp.default_capabilities()

  local on_attach = function(_, bufnr)

    local opts = { noremap = true, silent = false, buffer = bufnr }

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
    }
  })

  lspconfig["pyright"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })

	-- local luacheck = require("efmls-configs.linters.luacheck")
	-- local stylua = require("efmls-configs.formatters.stylua")
	-- local flake8 = require("efmls-configs.linters.flake8")
	-- local black = require("efmls-configs.formatters.black")
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
	-- local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
	-- vim.api.nvim_create_autocmd("BufWritePost", {
	-- 	group = lsp_fmt_group,
	-- 	callback = function()
	-- 		local efm = vim.lsp.get_active_clients({ name = "efm" })
	--
	-- 		if vim.tbl_isempty(efm) then
	-- 			return
	-- 		end
	--
	-- 		vim.lsp.buf.format({ name = "efm" })
	-- 	end,
	-- })
end

local keys = {}

return {
  url = url,
  main = main,
  -- cmd = cmd,
  event = event,
  priority = priority,
  lazy = lazy,
  enabled = enabled,
  dependencies = dependencies,
  -- opts = opts,
  config = config,
  keys = keys,
}
