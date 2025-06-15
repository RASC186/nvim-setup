require("startup")
require("options")
require("config")

--------------------------------------------------------------------------------

local comment = {
  main = comment_main,
  tag = comment_tag,
  url = comment_url,
  dependencies = comment_dependencies,
  lazy = comment_lazy,
  cmd = comment_cmd,
  events = comment_events,
  priority = comment_priority,
  opts = comment_opts,
  config = comment_config,
}

--------------------------------------------------------------------------------

local nvim_autopairs = {
  main = nvim_autopairs_main,
  tag = nvim_autopairs_tag,
  url = nvim_autopairs_url,
  dependencies = nvim_autopairs_dependencies,
  lazy = nvim_autopairs_lazy,
  cmd = nvim_autopairs_cmd,
  events = nvim_autopairs_events,
  priority = nvim_autopairs_priority,
  opts = nvim_autopairs_opts,
  config = nvim_autopairs_config,
}

--------------------------------------------------------------------------------

local vim_pencil = {
  main = vim_pencil_main,
  tag = vim_pencil_tag,
  url = vim_pencil_url,
  dependencies = vim_pencil_dependencies,
  lazy = vim_pencil_lazy,
  cmd = vim_pencil_cmd,
  events = vim_pencil_events,
  priority = vim_pencil_priority,
  opts = vim_pencil_opts,
  config = vim_pencil_config,
}

--------------------------------------------------------------------------------

local luasnip = {
  main = luasnip_main,
  tag = luasnip_tag,
  url = luasnip_url,
  dependencies = luasnip_dependencies,
  lazy = luasnip_lazy,
  cmd = luasnip_cmd,
  events = luasnip_events,
  priority = luasnip_priority,
  opts = luasnip_opts,
  config = luasnip_config,
}

--------------------------------------------------------------------------------

local markdown_preview = {
  main = markdown_preview_main,
  tag = markdown_preview_tag,
  url = markdown_preview_url,
  dependencies = markdown_preview_dependencies,
  lazy = markdown_preview_lazy,
  cmd = markdown_preview_cmd,
  events = markdown_preview_events,
  priority = markdown_preview_priority,
  opts = markdown_preview_opts,
  config = markdown_preview_config,
}

--------------------------------------------------------------------------------

local nvim_cmp = {
  main = nvim_cmp_main,
  tag = nvim_cmp_tag,
  url = nvim_cmp_url,
  dependencies = nvim_cmp_dependencies,
  lazy = nvim_cmp_lazy,
  cmd = nvim_cmp_cmd,
  events = nvim_cmp_events,
  priority = nvim_cmp_priority,
  opts = nvim_cmp_opts,
  config = nvim_cmp_config,
}

--------------------------------------------------------------------------------

local nvim_dap_virtual_text = {
  main = nvim_dap_virtual_text_main,
  tag = nvim_dap_virtual_text_tag,
  url = nvim_dap_virtual_text_url,
  dependencies = nvim_dap_virtual_text_dependencies,
  lazy = nvim_dap_virtual_text_lazy,
  cmd = nvim_dap_virtual_text_cmd,
  events = nvim_dap_virtual_text_events,
  priority = nvim_dap_virtual_text_priority,
  opts = nvim_dap_virtual_text_opts,
  config = nvim_dap_virtual_text_config,
}

--------------------------------------------------------------------------------

local dapui = {
  main = dapui_main,
  tag = dapui_tag,
  url = dapui_url,
  dependencies = dapui_dependencies,
  lazy = dapui_lazy,
  cmd = dapui_cmd,
  events = dapui_events,
  priority = dapui_priority,
  opts = dapui_opts,
  config = dapui_config,
}

--------------------------------------------------------------------------------

local dap = {
  main = dap_main,
  tag = dap_tag,
  url = dap_url,
  dependencies = dap_dependencies,
  lazy = dap_lazy,
  cmd = dap_cmd,
  events = dap_events,
  priority = dap_priority,
  opts = dap_opts,
  config = dap_config,
}

--------------------------------------------------------------------------------

local lldebugger = {
  main = lldebugger_main,
  tag = lldebugger_tag,
  url = lldebugger_url,
  dependencies = lldebugger_dependencies,
  lazy = lldebugger_lazy,
  cmd = lldebugger_cmd,
  events = lldebugger_events,
  priority = lldebugger_priority,
  opts = lldebugger_opts,
  config = lldebugger_config,
}

--------------------------------------------------------------------------------

local conform = {
  main = conform_main,
  tag = conform_tag,
  url = conform_url,
  dependencies = conform_dependencies,
  lazy = conform_lazy,
  cmd = conform_cmd,
  events = conform_events,
  priority = conform_priority,
  opts = conform_opts,
  config = conform_config,
}
--------------------------------------------------------------------------------

local gitsigns = {
  main = gitsigns_main,
  tag = gitsigns_tag,
  url = gitsigns_url,
  dependencies = gitsigns_dependencies,
  lazy = gitsigns_lazy,
  cmd = gitsigns_cmd,
  events = gitsigns_events,
  priority = gitsigns_priority,
  opts = gitsigns_opts,
  config = gitsigns_config,
}

--------------------------------------------------------------------------------

local nvim_lint = {
  main = nvim_lint_main,
  tag = nvim_lint_tag,
  url = nvim_lint_url,
  dependencies = nvim_lint_dependencies,
  lazy = nvim_lint_lazy,
  cmd = nvim_lint_cmd,
  events = nvim_lint_events,
  priority = nvim_lint_priority,
  opts = nvim_lint_opts,
  config = nvim_lint_config,
}

--------------------------------------------------------------------------------

local lspconfig = {
  main = lspconfig_main,
  tag = lspconfig_tag,
  url = lspconfig_url,
  dependencies = lspconfig_dependencies,
  lazy = lspconfig_lazy,
  cmd = lspconfig_cmd,
  events = lspconfig_events,
  priority = lspconfig_priority,
  opts = lspconfig_opts,
  config = lspconfig_config,
}

--------------------------------------------------------------------------------

local lspsaga = {
  main = lspsaga_main,
  tag = lspsaga_tag,
  url = lspsaga_url,
  dependencies = lspsaga_dependencies,
  lazy = lspsaga_lazy,
  cmd = lspsaga_cmd,
  events = lspsaga_events,
  priority = lspsaga_priority,
  opts = lspsaga_opts,
  config = lspsaga_config,
}

--------------------------------------------------------------------------------

local mason_lspconfig = {
  main = mason_lspconfig_main,
  tag = mason_lspconfig_tag,
  url = mason_lspconfig_url,
  dependencies = mason_lspconfig_dependencies,
  lazy = mason_lspconfig_lazy,
  cmd = mason_lspconfig_cmd,
  events = mason_lspconfig_events,
  priority = mason_lspconfig_priority,
  opts = mason_lspconfig_opts,
  config = mason_lspconfig_config,
}

--------------------------------------------------------------------------------

local mason_nvim_dap = {
  main = mason_nvim_dap_main,
  tag = mason_nvim_dap_tag,
  url = mason_nvim_dap_url,
  dependencies = mason_nvim_dap_dependencies,
  lazy = mason_nvim_dap_lazy,
  cmd = mason_nvim_dap_cmd,
  events = mason_nvim_dap_events,
  priority = mason_nvim_dap_priority,
  opts = mason_nvim_dap_opts,
  config = mason_nvim_dap_config,
}

--------------------------------------------------------------------------------

local mason = {
  main = mason_main,
  tag = mason_tag,
  url = mason_url,
  dependencies = mason_dependencies,
  lazy = mason_lazy,
  cmd = mason_cmd,
  events = mason_events,
  priority = mason_priority,
  opts = mason_opts,
  config = mason_config,
}

--------------------------------------------------------------------------------

local nvim_treesitter = {
  main = nvim_treesitter_main,
  tag = nvim_treesitter_tag,
  url = nvim_treesitter_url,
  dependencies = nvim_treesitter_dependencies,
  lazy = nvim_treesitter_lazy,
  cmd = nvim_treesitter_cmd,
  events = nvim_treesitter_events,
  priority = nvim_treesitter_priority,
  opts = nvim_treesitter_opts,
  config = nvim_treesitter_config,
}

--------------------------------------------------------------------------------

local illuminate = {
  main = illuminate_main,
  tag = illuminate_tag,
  url = illuminate_url,
  dependencies = illuminate_dependencies,
  lazy = illuminate_lazy,
  cmd = illuminate_cmd,
  events = illuminate_events,
  priority = illuminate_priority,
  opts = illuminate_opts,
  config = illuminate_config,
}

--------------------------------------------------------------------------------

local telescope = {
  main = telescope_main,
  tag = telescope_tag,
  url = telescope_url,
  dependencies = telescope_dependencies,
  lazy = telescope_lazy,
  cmd = telescope_cmd,
  events = telescope_events,
  priority = telescope_priority,
  opts = telescope_opts,
  config = telescope_config,
}

--------------------------------------------------------------------------------

local zen_mode = {
  main = zen_mode_main,
  tag = zen_mode_tag,
  url = zen_mode_url,
  dependencies = zen_mode_dependencies,
  lazy = zen_mode_lazy,
  cmd = zen_mode_cmd,
  events = zen_mode_events,
  priority = zen_mode_priority,
  opts = zen_mode_opts,
  config = zen_mode_config,
}

--------------------------------------------------------------------------------

local lspkind = {
  main = lspkind_main,
  tag = lspkind_tag,
  url = lspkind_url,
  dependencies = lspkind_dependencies,
  lazy = lspkind_lazy,
  cmd = lspkind_cmd,
  events = lspkind_events,
  priority = lspkind_priority,
  opts = lspkind_opts,
  config = lspkind_config,
}

--------------------------------------------------------------------------------

local lualine = {
  main = lualine_main,
  tag = lualine_tag,
  url = lualine_url,
  dependencies = lualine_dependencies,
  lazy = lualine_lazy,
  cmd = lualine_cmd,
  events = lualine_events,
  priority = lualine_priority,
  opts = lualine_opts,
  config = lualine_config,
}

--------------------------------------------------------------------------------

local nvim_tree = {
  main = nvim_tree_main,
  tag = nvim_tree_tag,
  url = nvim_tree_url,
  dependencies = nvim_tree_dependencies,
  lazy = nvim_tree_lazy,
  cmd = nvim_tree_cmd,
  events = nvim_tree_events,
  priority = nvim_tree_priority,
  opts = nvim_tree_opts,
  config = nvim_tree_config,
}

--------------------------------------------------------------------------------

local nvim_web_devicons = {
  main = nvim_web_devicons_main,
  tag = nvim_web_devicons_tag,
  url = nvim_web_devicons_url,
  dependencies = nvim_web_devicons_dependencies,
  lazy = nvim_web_devicons_lazy,
  cmd = nvim_web_devicons_cmd,
  events = nvim_web_devicons_events,
  priority = nvim_web_devicons_priority,
  opts = nvim_web_devicons_opts,
  config = nvim_web_devicons_config,
}

--------------------------------------------------------------------------------

local catppuccin = {
  main = catppuccin_main,
  tag = catppuccin_tag,
  url = catppuccin_url,
  dependencies = catppuccin_dependencies,
  lazy = catppuccin_lazy,
  cmd = catppuccin_cmd,
  events = catppuccin_events,
  priority = catppuccin_priority,
  opts = catppuccin_opts,
  config = catppuccin_config,
}

--------------------------------------------------------------------------------

local neoconf = {
  main = neoconf_main,
  tag = neoconf_tag,
  url = neoconf_url,
  dependencies = neoconf_dependencies,
  lazy = neoconf_lazy,
  cmd = neoconf_cmd,
  events = neoconf_events,
  priority = neoconf_priority,
  opts = neoconf_opts,
  config = neoconf_config,
}

--------------------------------------------------------------------------------

local neodev = {
  main = neodev_main,
  tag = neodev_tag,
  url = neodev_url,
  dependencies = neodev_dependencies,
  lazy = neodev_lazy,
  cmd = neodev_cmd,
  events = neodev_events,
  priority = neodev_priority,
  opts = neodev_opts,
  config = neodev_config,
}

--------------------------------------------------------------------------------

local plenary = {
  main = plenary_main,
  tag = plenary_tag,
  url = plenary_url,
  dependencies = plenary_dependencies,
  lazy = plenary_lazy,
  cmd = plenary_cmd,
  events = plenary_events,
  priority = plenary_priority,
  opts = plenary_opts,
  config = plenary_config,
}

--------------------------------------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local opts = {

  defaults = {
    lazy = true,
  },

  lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",

  install = {
    colorscheme = { "catppuccin" },
  },

  rtp = {
    disabled_plugins = {
      "gzip",
      "matchit",
      "matchparen",
      "netrw",
      "netrwPlugin",
      "tarPlugin",
      "tohtml",
      "tutor",
      "zipPlugin",
    },
  },

  change_detection = {
    notify = true,
  },
}

require("lazy").setup({
  neoconf,
  comment,
  nvim_autopairs,
  vim_pencil,
  luasnip,
  markdown_preview,
  nvim_cmp,
  nvim_dap_virtual_text,
  dapui,
  dap,
  lldebugger,
  conform,
  gitsigns,
  nvim_lint,
  lspconfig,
  lspsaga,
  mason_lspconfig,
  mason_nvim_dap,
  mason,
  nvim_treesitter,
  illuminate,
  telescope,
  zen_mode,
  lspkind,
  lualine,
  nvim_tree,
  nvim_web_devicons,
  catppuccin,
  neodev,
  plenary,
}, opts)

--------------------------------------------------------------------------------
