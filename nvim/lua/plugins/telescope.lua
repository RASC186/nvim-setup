local url = "nvim-telescope/telescope.nvim"

local main = "telescope"

local cmd = "Telescope"

local priority = 1

local lazy = false

local enabled = true

local dependencies = {
  "nvim-lua/plenary.nvim"
}

local opts = {

  -- Default configuration for telescope 
  defaults = {

    --Key mappings 
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
      }
    }
  },

  -- Default configuration for builtin
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
      hidden = true
    },
    live_grep = {
      theme = "dropdown",
      previewer = false
    },
    find_buffers = {
      theme = "dropdown",
      previewer = false
    }
  },

  -- Your extension configuration
  extensions = {
    -- Please take a look at the readme of the extension you want to configure
  }
}

local config = function()
  require(main).setup(opts)
end

local keys = {
  vim.keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>"),
  vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>"),
  vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>"),
  vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>"),
  vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
}

return {
  url = url, tag = '0.1.6',
  main = main,
  cmd = cmd,
  priority = priority,
  lazy = lazy,
  enabled = enabled,
  dependencies = dependencies,
  opts = opts,
  config = config,
  keys = keys,
}
