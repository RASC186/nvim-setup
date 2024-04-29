local url = "https://github.com/stevearc/conform.nvim"

local main = "conform"

-- local cmd = {}

local event = { "BufReadPre", "BufNewFile" }

local priority = 1

local lazy = false

local enabled = true

-- local dependencies = {}

local opts = {
	formatters_by_ft = {
		assembly = { "asmfmt" },
		bahs = { "beautysh" },
		c = { "clang-format" },
		cmake = { "cmakelang" },
		cpp = { "clang-format" },
		java = { "google-java-format" },
		javascript = { "prettier" },
		json = { "fixjson" },
		latex = { "latexindent" },
		lua = { "stylua", "luaformatter" },
		python = { "black", "isort", "autoflake" },
		sql = { "sqlfmt" },
		systemverilog = { "verible" },
		yaml = { "yamlfmt" },
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	},
}

local config = function()
	local conform = require(main)

	conform.setup(opts)

	vim.keymap.set("n", "=", function()
		conform.format({
			lsp_fallback = true,
			async = false,
			timeout_ms = 500,
		})
	end, { desc = "Format file" })
end

-- local keys = {}

return {
	url = url,
	main = main,
	-- cmd = cmd,
	event = event,
	priority = priority,
	lazy = lazy,
	enabled = enabled,
	-- dependencies = dependencies,
	-- opts = opts,
	config = config,
	-- keys = keys,
}
