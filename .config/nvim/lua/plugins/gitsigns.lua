return {
  "lewis6991/gitsigns.nvim",
  cmd = "Gitsigns",
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  opts = {},
  keys = {
    { "<leader>gB", "<cmd>Gitsigns blame<cr>", desc = "Git Blame" },
    { "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "Git Diff" },
  },
}
