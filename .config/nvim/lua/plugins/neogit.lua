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
    { "<leader>gb", "<cmd>Neogit branch<cr>", desc = "Branch" },
    { "<leader>gw", "<cmd>Neogit worktree<cr>", desc = "Work Tree" },
    { "<leader>gp", "<cmd>Neogit pull<cr>", desc = "Pull" },
    { "<leader>gP", "<cmd>Neogit push<cr>", desc = "Push" },
    { "<leader>gc", "<cmd>Neogit commit<cr>", desc = "Commit" },
  },
}
