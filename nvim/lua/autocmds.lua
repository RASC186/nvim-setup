---@diagnostic disable: lowercase-global, unused-local
--------------------------------------------------------------------------------

-- Comment

comment_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- Autopairs

nvim_autopairs_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- Pencil

vim_pencil_autocmds = function(plugin, opts)
  local pencil_augroup = vim.api.nvim_create_augroup("pencil", { clear = true })

  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "markdown", "tex", "bib" },
    group = pencil_augroup,
    callback = function()
      vim.cmd("SoftPencil")
    end,
  })

  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "text" },
    group = pencil_augroup,
    callback = function()
      vim.cmd("HardPencil")
    end,
  })
end

--------------------------------------------------------------------------------

-- luasnip

luasnip_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- vimtex

vimtex_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- markdown-preview

markdown_preview_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- nvim-cmp

nvim_cmp_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- nvim-dap-virtual-text

nvim_dap_virtual_text_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- dapui

dapui_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- dap

dap_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- conform

conform_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- Git

gitsigns_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- nvim-lint

nvim_lint_autocmds = function(plugin, opts)
  local lint = require(plugin.main)
  local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

  vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    group = lint_augroup,
    callback = function()
      lint.try_lint()
    end,
  })
end

--------------------------------------------------------------------------------

-- lspconfig

lspconfig_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- lspsaga

lspsaga_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- mason-lspconfig

mason_lspconfig_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- mason

mason_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- nvim-treesitter

nvim_treesitter_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- illuminate

illuminate_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- telescope

telescope_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- zen-mode

zen_mode_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- lspkind

lspkind_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- lualine

lualine_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- nvim-tree

nvim_tree_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- nvim-web-devicons

nvim_web_devicons_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- catppuccin

catppuccin_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- neoconf

neoconf_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- neodev

neodev_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- plenary

plenary_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------
