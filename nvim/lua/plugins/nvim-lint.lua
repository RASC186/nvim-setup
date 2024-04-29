local url = "https://github.com/mfussenegger/nvim-lint"

local main = "lint"

-- local cmd = {}

local event = { "BufReadPre", "BufNewFile" }

local priority = 1

local lazy = false

local enabled = true

-- local dependencies = {}

-- local opts = {}

local config = function()
	local lint = require(main)

	lint.linters_by_ft = {
		bash = { "shellcheck" },
		cmake = { "cmakelang", "cmakelint" },
		cpp = { "cpplint" },
		docker = { "hadolint" },
		html = { "htmlhint" },
		java = { "checkstyle" },
		javascript = { "eslint_d" },
		make = { "checkmake" },
		json = { "jsonlint" },
		latex = { "vale" },
		lua = { "luacheck" },
		markdown = { "vale", "write-good", "misspell" },
		python = { "flake8", "pydocstyle" },
		sql = { "sqlfluff" },
		systemverilog = { "verible" },
		yaml = { "yamllint" },
	}

	local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

	vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
		group = lint_augroup,
		callback = function()
			lint.try_lint()
		end,
	})

	vim.keymap.set("n", "<leader>l", function()
		lint.try_lint()
	end, { desc = "Trigger linting for current file" })
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
