---@diagnostic disable: lowercase-global, unused-local
--------------------------------------------------------------------------------

-- neovim

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>q", ":bdelete<CR>", { silent = true })
vim.keymap.set("n", "<leader><Right>", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<leader><Left>", ":bprevious<CR>", { silent = true })

vim.keymap.set("n", "<C-S-Up>", "<C-w>+", { silent = true })
vim.keymap.set("n", "<C-S-Down>", "<C-w>-", { silent = true })
vim.keymap.set("n", "<C-S-Right>", "<C-w>>", { silent = true })
vim.keymap.set("n", "<C-S-Left>", "<C-w><", { silent = true })
vim.keymap.set("n", "<leader>wh", ":split<CR>", { silent = true })
vim.keymap.set("n", "<leader>wv", ":vsplit<CR>", { silent = true })
vim.keymap.set("n", "<leader>wq", ":close<CR>", { silent = true })
vim.keymap.set("n", "<leader>wt", ":tab split<CR>", { silent = true })
vim.keymap.set("n", "<leader>w<Left>", ":tabp<CR>", { silent = true })
vim.keymap.set("n", "<leader>w<Right>", ":tabn<CR>", { silent = true })

vim.keymap.set("n", "<C-Up>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-Down>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-Left>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-Right>", "<c-w>l", { noremap = true })

vim.keymap.set("v", "<", "<gv", { noremap = true })
vim.keymap.set("v", ">", ">gv", { noremap = true })

vim.keymap.set("n", "<C-r>", "<nop>")
vim.keymap.set("n", "r", ":redo<CR>")

--------------------------------------------------------------------------------

-- Comment

comment_keymaps = function(plugin, opts)
	opts.toggler = {

		---Line-comment toggle keymap
		line = "gcc",

		---Block-comment toggle keymap
		block = "gbc",
	}

	opts.opleader = {

		---Line-comment keymap
		line = "gc",

		---Block-comment keymap
		block = "gb",
	}

	opts.extra = {

		---Add comment on the line above
		above = "gcO",

		---Add comment on the line below
		below = "gco",

		---Add comment at the end of line
		eol = "gcA",
	}

	opts.mappings = {

		basic = true,

		opleader = false,

		extra = false,
	}

	vim.api.nvim_set_keymap("n", "<C-_>", "gcc<ESC>", { silent = true })
	vim.api.nvim_set_keymap("v", "<C-_>", "gcc<ESC>", { silent = true })
end

--------------------------------------------------------------------------------

-- Autopairs

nvim_autopairs_keymaps = function(_, _) end

--------------------------------------------------------------------------------

-- Pencil

vim_pencil_keymaps = function(_, _)
	vim.api.nvim_set_keymap("n", "<leader>p", "gqap<ESC>", { silent = true })
	vim.api.nvim_set_keymap("n", "<leader>P", "ggVGgq<ESC>", { silent = true })
end

--------------------------------------------------------------------------------

-- luasnip

luasnip_keymaps = function(plugin, _)
	local luasnip = require(plugin.main)
	vim.keymap.set("i", "<C-l>", function()
		if luasnip.choice_active() then
			luasnip.change_choice(1)
		end
	end, { silent = true })
end

--------------------------------------------------------------------------------

-- cmp-vimtex

cmp_vimtex_keymaps = function(_, _) end

--------------------------------------------------------------------------------

-- vimtex

vimtex_keymaps = function(_, _) end

--------------------------------------------------------------------------------

-- markdown-preview

markdown_preview_keymaps = function(_, _) end

--------------------------------------------------------------------------------

-- nvim-cmp

nvim_cmp_keymaps = function(plugin, opts)
	local cmp = require(plugin.main)
	opts.mapping = cmp.mapping.preset.insert({
		["<Down>"] = cmp.mapping.select_next_item(),
		["<Up>"] = cmp.mapping.select_prev_item(),
		["<S-Up>"] = cmp.mapping.scroll_docs(-4),
		["<S-Down>"] = cmp.mapping.scroll_docs(4),
		["<Esc>"] = cmp.mapping.abort(),
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
	})
end

--------------------------------------------------------------------------------

-- nvim-dap-virtual-text

nvim_dap_virtual_text_keymaps = function(_, _) end

--------------------------------------------------------------------------------

-- dapui

dapui_keymaps = function(plugin, _)
	local dapui = require(plugin.main)
	vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require('dapui').open({reset=true})<CR><ESC>", {})
	vim.api.nvim_set_keymap("n", "<leader>dt", ":lua require('dapui').toggle({reset=true})<CR><ESC>", {})
	vim.api.nvim_set_keymap("n", "<leader>dq", ":lua require('dapui').close()<CR><ESC>", {})
end

--------------------------------------------------------------------------------

-- dap

dap_keymaps = function(plugin, _)
	local dap = require(plugin.main)
	vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
	vim.keymap.set("n", "<leader>dc", dap.continue)
	vim.keymap.set("n", "<leader>dn", dap.step_over)
	vim.keymap.set("n", "<leader>di", dap.step_into)
	vim.keymap.set("n", "<leader>dp", dap.step_back)
	vim.keymap.set("n", "<leader>dd", function()
		dap.disconnect()
		dap.close()
	end, {})
end

--------------------------------------------------------------------------------

-- lldebugger

lldebugger_keymaps = function(_, _) end

--------------------------------------------------------------------------------

-- dap-python

dap_python_keymaps = function(_, _) end

--------------------------------------------------------------------------------

-- conform

conform_keymaps = function(plugin, opts)
	local conform = require(plugin.main)
	vim.keymap.set({ "n", "v" }, "=", function()
		conform.format({ lsp_fallback = true, async = true })
	end, { desc = "Format file" })
end

--------------------------------------------------------------------------------

-- Git

gitsigns_keymaps = function(_, _)
	vim.keymap.set("n", "<leader>gs", ":Gitsigns toggle_signs<CR><ESC>")
	vim.keymap.set("n", "<leader>gn", ":Gitsigns toggle_numhl<CR><ESC>")
	vim.keymap.set("n", "<leader>gl", ":Gitsigns toggle_linehl<CR><ESC>")
	vim.keymap.set("n", "<leader>gd", ":Gitsigns toggle_word_diff<CR><Esc>")
	vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk_inline<CR><Esc>")
	vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR><Esc>")
end

--------------------------------------------------------------------------------

-- nvim-lint

nvim_lint_keymaps = function(plugin, opts)
	local lint = require(plugin.main)
	vim.keymap.set("n", "<leader>l", function()
		lint.try_lint()
	end, { desc = "Trigger linting for current file" })
end

--------------------------------------------------------------------------------

-- lspconfig

lspconfig_keymaps = function(_, _) end

--------------------------------------------------------------------------------

-- lspsaga

lspsaga_keymaps = function(_, _) end

--------------------------------------------------------------------------------

-- mason-lspconfig

mason_lspconfig_keymaps = function(_, _) end
--------------------------------------------------------------------------------

-- mason-nvim-dap

mason_nvim_dap_keymaps = function(_, _) end

--------------------------------------------------------------------------------

-- mason

mason_keymaps = function(plugin, opts)
	opts.ui.keymaps = {

		toggle_package_expand = "<CR>",

		install_package = "i",

		update_package = "u",

		check_package_version = "c",

		update_all_packages = "U",

		check_outdated_packages = "C",

		uninstall_package = "X",

		cancel_installation = "<C-c>",

		apply_language_filter = "<C-f>",

		toggle_package_install_log = "<CR>",

		toggle_help = "g?",
	}
end

--------------------------------------------------------------------------------

-- nvim-treesitter

nvim_treesitter_keymaps = function(plugin, opts)
	local slow_scroll = function(prompt_bufnr, direction)
		local state = require("telescope.state")
		local action_state = require("telescope.actions.state")

		local previewer = action_state.get_current_picker(prompt_bufnr).previewer

		local status = state.get_status(prompt_bufnr)

		if type(previewer) ~= "table" or previewer.scroll_fn == function(_, _) end or status.preview_win == nil then
			return
		end

		previewer:scroll_fn(1 * direction)
	end

	opts.defaults = {

		mappings = {

			i = {
				["<S-Up>"] = function(bufnr)
					slow_scroll(bufnr, -1)
				end,
				["<S-Down>"] = function(bufnr)
					slow_scroll(bufnr, 1)
				end,
			},
		},
	}
end

--------------------------------------------------------------------------------

-- illuminate

illuminate_keymaps = function(plugin, opts)
	vim.api.nvim_set_keymap("n", "<A-Left>", "<A-p>", { silent = true })
	vim.api.nvim_set_keymap("n", "<A-Right>", "<A-n>", { silent = true })
end

--------------------------------------------------------------------------------

-- telescope

telescope_keymaps = function(plugin, opts)
	vim.keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>", {})
	vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", {})
	vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", {})
	vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", {})
	vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", {})
	vim.keymap.set("n", "<leader>fr", ":Telescope lsp_references<CR>", {})
end

--------------------------------------------------------------------------------

-- twilight

twilight_keymaps = function(_, _) end

--------------------------------------------------------------------------------

-- zen-mode

zen_mode_keymaps = function(_, _)
	vim.keymap.set("n", "<leader>Z", ":ZenMode<CR><ESC>")
end

--------------------------------------------------------------------------------

-- lspkind

lspkind_keymaps = function(_, _) end

--------------------------------------------------------------------------------

-- lualine

lualine_keymaps = function(_, _) end

--------------------------------------------------------------------------------

-- nvim-tree

nvim_tree_keymaps = function(plugin, opts)
	vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", { noremap = true })
end

--------------------------------------------------------------------------------

-- nvim-web-devicons

nvim_web_devicons_keymaps = function(_, _) end

--------------------------------------------------------------------------------

-- tokyonight

tokyonight_keymaps = function(_, _) end

--------------------------------------------------------------------------------

-- neoconf

neoconf_keymaps = function(_, _) end

--------------------------------------------------------------------------------

-- neodev

neodev_keymaps = function(_, _) end

--------------------------------------------------------------------------------

-- plenary

plenary_keymaps = function(_, _) end

--------------------------------------------------------------------------------
