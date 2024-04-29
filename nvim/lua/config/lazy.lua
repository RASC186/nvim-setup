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

  lockfile = vim.fn.stdpath("config") .. "/lua/plugins/lazy-lock.json",

  install = {
		colorscheme = { "tokyonight" },
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

require("lazy").setup(
  {
    { import = "plugins" },
    { import = "plugins.lsp" },
  },
  opts
)

