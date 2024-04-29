local url = "https://github.com/nvim-lualine/lualine.nvim"

local main = "lualine"

-- local cmd = {}

local priority = 1

local lazy = false

local enabled = true

-- local dependencies = {}

local opts = {

  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'filename'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
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
  -- dependencies = dependencies,
  opts = opts,
  config = config,
  -- keys = keys,
}
