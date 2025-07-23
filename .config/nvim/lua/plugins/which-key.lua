return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    delay = 1000,
    preset = "helix",
    icons = {
      mappings = true,
    },
    spec = {
      { "<leader>s", group = "Search" },
      { "<leader>f", group = "Find" },
      { "<leader>b", group = "Buffers" },
      { "<leader>g", group = "Git" },
      { "<leader>x", group = "Diagonostics" },
      { "gr", group = "LSP" },
    },
  },
}
