return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  opts = {},
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diff" },
    { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Diff Quit" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "History" },
  },
}
