local url = "https://github.com/folke/neoconf.nvim"

local main = "neoconf"

local cmd = "Neoconf"

local priority = 8001

local lazy = false

local enabled = true

-- local dependencies = {}

local opts = {

  -- Name of the local settings files
  local_settings = ".neoconf.json",

  -- Name of the global settings file in your Neovim config directory
  global_settings = "/util/neoconf/neoconf.json",

  -- Import existing settings from other plugins
  import = {

    -- Local .vscode/settings.json
    vscode = true,

    -- Global/Local coc-settings.json
    coc = true,

    -- Global/Local nlsp-settings.nvim json settings
    nlsp = true,
  },

  -- Send new configuration to lsp clients when changing json settings
  live_reload = true,

  -- Set the filetype to jsonc for settings files, so you can use comments
  -- Make sure you have the jsonc treesitter parser installed!
  filetype_jsonc = true,

  plugins = {

    -- Configures lsp clients with settings in the following order:
    -- - lua settings passed in lspconfig setup
    -- - global json settings
    -- - local json settings
    lspconfig = {
      enabled = true,
    },

    -- Configures jsonls to get completion in .nvim.settings.json files
    jsonls = {

      enabled = true,

      -- Only show completion in json settings for configured lsp servers
      configured_servers_only = true,
    },

    -- Configures lua_ls to get completion of lspconfig server settings
    lua_ls = {

      -- By default, lua_ls annotations are only enabled in your neovim config 
      -- directory
      enabled_for_neovim_config = true,

      -- Explicitely enable adding annotations. Mostly relevant to put in your 
      -- local .nvim.settings.json file
      enabled = false,
    },
  },
}

local config = function()
  require(main).setup(opts)
end

-- local keys = {}

return {
  url = url,
  main = main,
  cmd = cmd,
  priority = priority,
  lazy = lazy,
  enabled = enabled,
  -- dependencies = dependencies,
  opts = opts,
  config = config,
  -- keys = keys,
}
