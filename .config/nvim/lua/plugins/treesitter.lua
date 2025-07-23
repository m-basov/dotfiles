return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
  cmd = { "TSUpdate", "TSUpdateSync", "TSInstall" },
  opts = {
    ensure_installed = {
      "vim",
      "regex",
      "lua",
      "bash",
      "markdown",
      "markdown_inline",
      "javascript",
      "typescript",
      "json",
    },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
}
