local config = function()
  require("nvim-treesitter.configs").setup({
    indent={
      enable = true
    },
    autotag = {
      enable = true
    },
    ensure_installed = {
      "lua",
      "bash",
      "c",
      "cpp",
      "python",
      "javascript",
      "html",
      "css",
      "json",
      "yaml",
      "markdown",
      "dockerfile",
      "gitignore"
    },
    auto_install = {
      highlight = {
        enable = true,
        additional_vim_regex_highlight = true
      }
    }
  })
end

return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  config = config
}
