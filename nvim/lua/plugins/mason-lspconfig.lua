local opts = {
  ensure_installed = {
    'efm',
    'lua_ls'
  },
  automatic_installation = true
}

return {
  "williamboman/mason-lspconfig.nvim",
  opts = opts,
  event = "bufReadPre",
  dependencies = "neovim/nvim-lspconfig",
}
