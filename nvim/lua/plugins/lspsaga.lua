local url = "https://github.com/nvimdev/lspsaga.nvim"

local main = "lspsaga"

-- local cmd = {}

local priority = 1

local lazy = false

local enabled = true

local dependencies = {
  "nvim-treesitter/nvim-treesitter",
}

-- local opts = {}

-- local config = {}

-- local keys = {}

return {
  url = url,
  main = main,
  -- cmd = cmd,
  priority = priority,
  lazy = lazy,
  enabled = enabled,
  dependencies = dependencies,
  -- opts = opts,
  -- config = config,
  -- keys = keys,
}
