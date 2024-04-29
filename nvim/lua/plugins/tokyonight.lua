local url = "https://github.com/folke/tokyonight.nvim"

local main = "tokyonight"

-- local cmd = {}

local priority = 8001

local lazy = false

local enabled = true

-- local dependencies = {}

local opts = {

	-- The theme comes in four styles, `storm`, `moon`, `night` and `day`
	style = "night",

	-- The theme is used when the background is set to light
	light_style = "day",

	-- Enable this to disable setting the background color
	transparent = false,

	-- Configure the colors used when opening a `:terminal` in Neovim
	terminal_colors = true,

	styles = {

		-- Style for comments
		comments = { italic = true },

		-- Style for keywords
		keywords = { italic = false },

		-- Style for functions
		functions = { italic = false },

		-- Style for variables
		variables = { italic = false },

		-- Style for sidebars
		sidebars = "dark",

		-- style for floating windows
		floats = "dark",
	},

	-- Set a darker background on sidebar-like windows. For example:
	-- `["qf", "vista_kind", "terminal", "packer"]`
	sidebars = { "qf", "help" },

	-- Adjusts the brightness of the colors of the **Day** style. Number between
	-- 0 and 1, from dull to vibrant colors
	day_brightness = 0.3,

	-- Enabling this option, will hide inactive statuslines and replace them with
	-- a thin border instead. Should work with the standard **StatusLine** and
	-- **LuaLine**.
	hide_inactive_statusline = false,

	-- dims inactive windows
	dim_inactive = true,

	-- When `true`, section headers in the lualine theme will be bold
	lualine_bold = false,

	--- You can override specific color groups to use other groups or a hex color
	--- function will be called with a ColorScheme table
	-- on_colors = function(colors) end,

	--- You can override specific highlights to use other groups or a hex color
	--- function will be called with a Highlights and ColorScheme table
	-- on_highlights = function(highlights, colors) end,
}

local config = function()
	require(main).setup(opts)
	vim.cmd([[colorscheme tokyonight]])
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
