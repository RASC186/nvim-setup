local url = "https://github.com/mfussenegger/nvim-dap"

local main = "dap"

-- local cmd = {}

local priority = 1

local lazy = false

local enabled = true

-- local dependencies = {}

-- local opts = {}

local config = function()

  local dap = require(main)

  dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "-i", "dap" }
  }

  dap.configurations.c = {
    {
      name = "Launch",
      type = "gdb",
      request = "launch",
      program = function()
        return vim.fn.input(
          'Path to executable: ', vim.fn.getcwd() .. '/', 'file'
        )
      end,
      cwd = "${workspaceFolder}",
      stopAtBeginningOfMainSubprogram = false,
    },
  }
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
  -- opts = opts,
  config = config,
  -- keys = keys,
}
