local url = "https://github.com/onsails/lspkind.nvim"

local main = "lspkind"

-- local cmd = {}

local priority = 1

local lazy = false

local enabled = true

-- local dependencies = {}

local opts = {

  -- defines how annotations are shown
  -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
  mode = 'symbol_text',

  -- default symbol map
  -- can be either 'default' (requires nerd-fonts font) or
  -- 'codicons' for codicon preset (requires vscode-codicons font)
  preset = 'codicons',

  -- override preset symbols
  symbol_map = {
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
  },
}

local config = function()
  require(main).init(opts)
end

-- local keys = {}

return {
  url = url,
  main = main,
  -- cmd = cmd,
  priority = priority,
  lazy = lazy,
  enabled = enabled,
  -- dependencies = dependencies,
  -- opts = opts,
  config = config,
  -- keys = keys,
}
