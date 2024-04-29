local url = "https://github.com/hrsh7th/nvim-cmp"

local main = "cmp"

local cmd = {}

local event = "InsertEnter"

local priority = 1

local lazy = false

local enabled = true

local dependencies = {
	"https://github.com/hrsh7th/cmp-nvim-lsp",
	"https://github.com/hrsh7th/cmp-buffer",
	"https://github.com/hrsh7th/cmp-path",
	"https://github.com/hrsh7th/cmp-cmdline",
	"https://github.com/L3MON4D3/LuaSnip",
	"https://github.com/saadparwaiz1/cmp_luasnip",
	"https://github.com/rafamadriz/friendly-snippets",
}

-- local opts = {}

local config = function()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	local lspkind = require("lspkind")

	require("luasnip/loaders/from_vscode").lazy_load()

	local opts = {

		completion = {
			completeopt = "menu,menuone,preview,noselect",
		},

		mapping = cmp.mapping.preset.insert({

			["<Down>"] = cmp.mapping.select_next_item(),

			["<Up>"] = cmp.mapping.select_prev_item(),

			["<S-Up>"] = cmp.mapping.scroll_docs(-4),

			["<S-Down>"] = cmp.mapping.scroll_docs(4),

			["<Esc>"] = cmp.mapping.abort(),

			["<Tab>"] = cmp.mapping.confirm({ select = true }),
		}),

		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},

		formatting = {

			fields = { "kind", "abbr", "menu" },

			format = function(entry, vim_item)
				vim_item.kind = string.format("%s", lspkind.symbol_map[vim_item.kind])

				vim_item.menu = ({
					nvim_lsp = "[LSP]",
					luasnip = "[snippet]",
					buffer = "[buffer]",
					path = "[path]",
				})[entry.source_name]

				return vim_item
			end,
		},

		window = {
			documentation = cmp.config.window.bordered(),
		},

		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "path" },
		}),
	}

	cmp.setup(opts)
end

-- local keys = {}

return {
	url = url,
	main = main,
	cmd = cmd,
	event = event,
	priority = priority,
	lazy = lazy,
	enabled = enabled,
	dependencies = dependencies,
	-- opts = opts,
	config = config,
	-- keys = keys,
}
