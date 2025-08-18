return {
  "NeogitOrg/neogit",
  cmd = "Neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "diffview.nvim",
  },
  opts = {
    graph_style = "kitty",
    process_spinner = true,
    kind = "auto",
    signs = {
      hunk = { "", "" },
      item = { "", "" },
      section = { "", "" },
    },
  },
  keys = {
    { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
    { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
  },
}
