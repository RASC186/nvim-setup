--------------------------------------------------------------------------------

-- Comment

local comment_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- Autopairs

local nvim_autopairs_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- Spectre

local spectre_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- Pencil

local vim_pencil_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- nvim-cmp

local nvim_cmp_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- dap

local dap_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- conform

local conform_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- Git

local gitsigns_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- nvim-lint

local nvim_lint_autocmds = function(plugin, opts)
	local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

	vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
		group = lint_augroup,
		callback = function()
			plugin.try_lint()
		end,
	})
end

--------------------------------------------------------------------------------

-- lspconfig

local lspconfig_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- lspsaga

local lspsaga_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- mason-lspconfig

local mason_lspconfig_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- mason

local mason_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- nvim-treesitter

local nvim_treesitter_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- illuminate

local illuminate_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- telescope

local telescope_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- goyo

local goyo_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- lspkind

local lspkind_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- lualine

local lualine_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- nvim-tree

local nvim_tree_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- nvim-web-devicons

local nvim_web_devicons_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- tokyonight

local tokyonight_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- neoconf

local neoconf_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- neodev

local neodev_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------

-- plenary

local plenary_autocmds = function(plugin, opts) end

--------------------------------------------------------------------------------
