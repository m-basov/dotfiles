return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  opts = {
    focus = true,
    auto_close = true,
    warn_no_results = false,
    open_no_results = true,
    auto_preview = false,
    modes = {
      diagnostics = {
        filter = {
          ["not"] = { severity = vim.diagnostic.severity.HINT },
        },
      },
    },
  },
  keys = {
    { "<leader>xx", "<cmd> Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
    { "<leader>xX", "<cmd> Trouble diagnostics toggle filter.buf=0<cr>", desc = "Diagnostics Buffer" },
  },
}
