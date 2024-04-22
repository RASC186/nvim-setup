local url = "nvim-treesitter/nvim-treesitter"

local main = "nvim-treesitter.configs"

local cmd = {
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

local priority = 1

local lazy = false

local enabled = true

-- local dependencies = {}

local opts = {

  -- A list of parser names, or "all"
  ensure_installed = {
    "c",
    "cpp",
    "python",
    "bash",
    "lua",
    "jsonc",
    "vim",
    "vimdoc",
    "markdown",
    -- "latex",
    "query"
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing, or "all"
  ignore_install = {},

  highlight = {

    enable = true,

    -- List of languages that will be disabled
    disable = {},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same 
    -- time. Set this to `true` if you depend on 'syntax' being enabled (like 
    -- for indentation). Using this option may slow down your editor, and you 
    -- may see some duplicate highlights. Instead of true it can also be a list 
    -- of languages
    additional_vim_regex_highlighting = false,
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
