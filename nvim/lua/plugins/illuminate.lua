local url = "https://github.com/RRethy/vim-illuminate"

local main = "illuminate"

local cmd = {
	"IlluminatePause",
	"IlluminateResume",
	"IlluminateToggle",
	"IlluminatePauseBuf",
	"IlluminateResumeBuf",
	"IlluminateToggleBuf",
}

local priority = 1

local lazy = false

local enabled = true

-- local dependencies = {}

local opts = {

	-- Providers used to get references in the buffer, ordered by priority
	providers = {
		"regex",
		"treesitter",
		"lsp",
	},

	-- Delay in milliseconds
	delay = 100,

	-- Filetype specific overrides.
	filetype_overrides = {},

	-- Filetypes to not illuminate, this overrides filetypes_allowlist
	filetypes_denylist = {
		"dirbuf",
		"dirvish",
		"fugitive",
	},

	-- Filetypes to illuminate, this is overridden by filetypes_denylist
	filetypes_allowlist = {},

	-- Modes to not illuminate, this overrides modes_allowlist
	modes_denylist = {},

	-- Modes to illuminate, this is overridden by modes_denylist
	modes_allowlist = {},

	-- Syntax to not illuminate, this overrides
	-- providers_regex_syntax_allowlist. Only applies to the 'regex' provider
	providers_regex_syntax_denylist = {},

	-- Syntax to illuminate, this is overridden by
	-- providers_regex_syntax_denylist. Only applies to the 'regex' provider
	providers_regex_syntax_allowlist = {},

	-- Whether or not to illuminate under the cursor
	under_cursor = true,

	-- Number of lines at which to use large_file_config
	-- The `under_cursor` option is disabled when this cutoff is hit
	large_file_cutoff = nil,

	-- large_file_config: config to use for large files (based on
	-- large_file_cutoff). Supports the same keys passed to .configure If nil,
	-- vim-illuminate will be disabled for large files.
	large_file_overrides = nil,

	-- Minimum number of matches required to perform highlighting
	min_count_to_highlight = 1,

	-- A callback that overrides all other settings to enable/disable
	-- illumination. This will be called a lot so don't do
	-- anything expensive in it.
	should_enable = function(_)
		return true
	end,

	-- Sets regex case sensitivity
	case_insensitive_regex = false,
}

local config = function()
	require(main).configure(opts)
end

local keys = {
	vim.api.nvim_set_keymap("n", "<A-Left>", "<A-p>", { silent = true }),
	vim.api.nvim_set_keymap("n", "<A-Right>", "<A-n>", { silent = true }),
}

return {
	url = url,
	main = main,
	cmd = cmd,
	priority = priority,
	lazy = lazy,
	enabled = enabled,
	-- dependencies = dependencies,
	opts = opts,
	config = config,
	keys = keys,
}
