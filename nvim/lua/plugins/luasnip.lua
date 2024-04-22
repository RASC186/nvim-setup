local url = "L3MON4D3/LuaSnip"

local main = "luasnip"

-- local cmd = {}

local priority = 1

local lazy = false

local enabled = true

-- local dependencies = {}

-- local opts = {}

-- local config = {}

-- local keys = {}

return {
  url = url,
  main = main,
  version = "v2.*",
	build = "make install_jsregexp",
  -- cmd = cmd,
  priority = priority,
  lazy = lazy,
  enabled = enabled,
  -- dependencies = dependencies,
  -- opts = opts,
  -- config = config,
  -- keys = keys,
}
