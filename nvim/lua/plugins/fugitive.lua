local url = "https://github.com/tpope/vim-fugitive"

local main = "vim-fugitive"

local cmd = {
  "Git",
  "Gedit",
  "Gread",
  "Gwrite",
  "Ggrep",
  "GMove",
  "GDelete",
  "GBrowse"
}

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
  cmd = cmd,
  priority = priority,
  lazy = lazy,
  enabled = enabled,
  -- dependencies = dependencies,
  -- opts = opts,
  -- config = config,
  -- keys = keys,
}
