local url = "nvim-tree/nvim-tree.lua.git"

local main = "nvim-tree"

-- local cmd = {}

local priority = 1

local lazy = false

local enabled = true

-- local dependencies = {}

local opts = {

  sort = {
    sorter = "case_sensitive",
  },

  view = {
    width = 35,
  },

  renderer = {
    group_empty = true,
  },

  filters = {
    dotfiles = true,
  },
}

local config = function()
  require(main).setup(opts)
end

local keys = {
  vim.keymap.set(
    "n", "<leader>t", ":NvimTreeToggle<CR>", { noremap = true, silent = true }
  ),
}

return {
  url = url,
  main = main,
  -- cmd = cmd,
  priority = priority,
  lazy = lazy,
  enabled = enabled,
  -- dependencies = dependencies,
  opts = opts,
  config = config,
  keys = keys,
}
