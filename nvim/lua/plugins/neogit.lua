local url = "https://github.com/NeogitOrg/neogit"

local main = "neogit"

-- local cmd = {}

local priority = 1

local lazy = false

local enabled = true

local dependencies = {
  "nvim-lua/plenary.nvim"
}

-- local opts = {}

local config = true

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
  config = config,
  -- keys = keys,
}
