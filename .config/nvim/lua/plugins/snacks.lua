return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  version = "^2.22.0",
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    explorer = { enabled = true, replace_netrw = true },
    picker = { enabled = true, hidden = true },
    statuscolumn = { enabled = true },
    lazygit = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = true, animate = { duration = { total = 100 } } },
  },
  keys = {
    -- Explorer
    { "<leader>e", function() Snacks.explorer() end, desc = "Explorer" },
    -- Files
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>ff", function() Snacks.picker.files({ hidden = true }) end, desc = "Find Files" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Find Recent" },
    -- Git
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    -- Buffers
    { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
    -- Grep
    { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
    -- Picker
    { "<leader>`", function() Snacks.picker.pickers() end, desc = "Pickers" },
  },
}
