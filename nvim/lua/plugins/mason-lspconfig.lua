local url = "williamboman/mason-lspconfig.nvim"

local main = "mason-lspconfig"

-- local cmd = {}

local priority = 1

local lazy = false

local enabled = true

local dependencies = {
  "williamboman/mason.nvim"
}

local opts = {

    -- A list of servers to automatically install if they're not already 
    -- installed. This setting has no relation with the automatic_installation 
    -- setting.
    ensure_installed = {
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
    },

    -- Whether servers that are set up (via lspconfig) should be automatically 
    -- installed if they're not already installed.
    -- This setting has no relation with the `ensure_installed` setting.
    automatic_installation = true,

    -- See `:h mason-lspconfig.setup_handlers()`
    handlers = nil,
}

local config = function()
  require(main).setup(opts)
end

-- local keys = {}

return {
  url = url,
  main = main,
  -- cmd = cmd,
  priority = priority,
  lazy = lazy,
  enabled = enabled,
  dependencies = dependencies,
  opts = opts,
  config = config,
  -- keys = keys,
}
