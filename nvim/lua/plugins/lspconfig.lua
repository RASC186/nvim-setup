local url = "neovim/nvim-lspconfig"

local main = "lspconfig"

local cmd = {}

local priority = 1

local lazy = false

local enabled = true

local dependencies = {}

local opts = {}

local on_attach = function(client, bufnr)

  local opts = { noremap = true, silent = true, buffer = bufnr }

	-- lua
  if client.name == "lua_ls" then
    vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
    vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
    vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
    vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
    vim.keymap.set("n", "<leader>pd", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
    vim.keymap.set("n", "<leader>nd", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
    vim.keymap.set("n", "<leader>lo", "<cmd>LSoutlineToggle<CR>", opts)
  end

  -- python
  if client.name == "pyright" then
    vim.keymap.set("n", "<leader>oi", "<cmd>PyrightOrganizeImports<CR>", opts)
  end

end

local config = function()

  -- require("neoconf").setup({})
  -- local cmp_nvim_lsp = require("cmp_nvim_lsp")

	local lspconfig = require("lspconfig")

  local signs = { Error = "󰅙 ", Warn = " ", Hint = "󰠠 ", Info = "󰋗 " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	-- lua
	lspconfig.lua_ls.setup({
		-- capabilities = capabilities,
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

  lspconfig.pyright.setup({
    -- capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      pyright = {
        disableOrganizeImports = false,
        analysis = {
          useLibraryCodeForTypes = true,
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          autoImportCompletions = true,
        },
      }
    }
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
  cmd = cmd,
  priority = priority,
  lazy = lazy,
  enabled = enabled,
  dependencies = dependencies,
  opts = opts,
  config = config,
  keys = keys,
}
