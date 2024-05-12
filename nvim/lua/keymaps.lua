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

	vim.keymap.set({ "n", "v" }, "<C-_>", "gcc<esc>", {})
end

--------------------------------------------------------------------------------

-- Autopairs

nvim_autopairs_keymaps = function(_, _) end

--------------------------------------------------------------------------------

-- Spectre

spectre_keymaps = function(plugin, opts)
	-- Internal key mapping

	plugin.opts.mapping = {

		["tab"] = {
			map = "<Tab>",
			cmd = "<cmd>lua require('spectre').tab()<cr>",
			desc = "Next query",
		},

		["shift-tab"] = {
			map = "<S-Tab>",
			cmd = "<cmd>lua require('spectre').tab_shift()<cr>",
			desc = "Previous query",
		},

		["toggle_line"] = {
			map = "dd",
			cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
			desc = "toggle item",
		},

		["enter_file"] = {
			map = "<cr>",
			cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
			desc = "open file",
		},

		["send_to_qf"] = {
			map = "<leader>q",
			cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
			desc = "send all items to quickfix",
		},

		["replace_cmd"] = {
			map = "<leader>c",
			cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
			desc = "input replace command",
		},

		["show_option_menu"] = {
			map = "<leader>o",
			cmd = "<cmd>lua require('spectre').show_options()<CR>",
			desc = "show options",
		},

		["run_current_replace"] = {
			map = "<leader>rc",
			cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
			desc = "replace current line",
		},

		["run_replace"] = {
			map = "<leader>R",
			cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
			desc = "replace all",
		},

		["change_view_mode"] = {
			map = "<leader>v",
			cmd = "<cmd>lua require('spectre').change_view()<CR>",
			desc = "change result view mode",
		},

		["change_replace_sed"] = {
			map = "trs",
			cmd = "<cmd>lua require('spectre').change_engine_replace('sed')<CR>",
			desc = "use sed to replace",
		},

		["change_replace_oxi"] = {
			map = "tro",
			cmd = "<cmd>lua require('spectre').change_engine_replace('oxi')<CR>",
			desc = "use oxi to replace",
		},

		["toggle_live_update"] = {
			map = "tu",
			cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
			desc = "update when vim writes to file",
		},

		["toggle_ignore_case"] = {
			map = "ti",
			cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
			desc = "toggle ignore case",
		},

		["toggle_ignore_hidden"] = {
			map = "th",
			cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
			desc = "toggle search hidden",
		},

		["resume_last_search"] = {
			map = "<leader>l",
			cmd = "<cmd>lua require('spectre').resume_last_search()<CR>",
			desc = "repeat last search",
		},
	}

	-- Key mapping

	vim.keymap.set(
		"n",
		"<leader>sw",
		'<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
		{ desc = "Search current word" }
	)

	vim.keymap.set(
		"v",
		"<leader>sw",
		'<esc><cmd>lua require("spectre").open_visual()<CR>',
		{ desc = "Search current word" }
	)

	vim.keymap.set(
		"n",
		"<leader>sp",
		'<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
		{ desc = "Search on current file" }
	)

	vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {})
end

--------------------------------------------------------------------------------

-- Pencil

vim_pencil_keymaps = function(_, _) end

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

-- dap

dap_keymaps = function(_, _) end

--------------------------------------------------------------------------------

-- conform

conform_keymaps = function(plugin, opts)
	local conform = require(plugin.main)

	vim.keymap.set("n", "=", function()
		conform.format({ lsp_fallback = true, async = false, timeout_ms = 500 })
	end, { desc = "Format file" })
end

--------------------------------------------------------------------------------

-- Git

gitsigns_keymaps = function(plugin, opts)
	vim.keymap.set("n", "<leader>gs", ":Gitsigns toggle_signs<CR><ESC>", {})
	vim.keymap.set("n", "<leader>gn", ":Gitsigns toggle_numhl<CR><ESC>", {})
	vim.keymap.set("n", "<leader>gl", ":Gitsigns toggle_linehl<CR><ESC>", {})
	vim.keymap.set("n", "<leader>gd", ":Gitsigns toggle_word_diff<CR><Esc>", {})
	vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk_inline<CR><Esc>", {})
	vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR><Esc>", {})
end

--------------------------------------------------------------------------------

-- nvim-lint

nvim_lint_keymaps = function(plugin, opts)
	vim.keymap.set("n", "<leader>l", function()
		plugin.try_lint()
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

				["<C-h>"] = "which_key",

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
	vim.keymap.set("n", "<A-Left>", "<A-p>", {})
	vim.keymap.set("n", "<A-Right>", "<A-n>", {})
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

-- goyo

goyo_keymaps = function(plugin, opts)
	vim.keymap.set("n", "<leader>gg", ":Goyo<CR>")
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
