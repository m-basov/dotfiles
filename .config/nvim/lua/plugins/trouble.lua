return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  opts = {
    auto_refresh = false,
    focus = false,
    auto_close = false,
    auto_jump = false,
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
    { "<leader>xx", "<cmd>Trouble diagnostics toggle auto_refresh=true<CR>", desc = "Diagnostics" },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0 auto_refresh=true<CR>", desc = "Diagnostics Buffer" },

    { "grr", "<cmd>Trouble lsp_references<CR>", desc = "LSP References" },
    { "gri", "<cmd>Trouble lsp_implementations<CR>", desc = "LSP Implementations" },
    { "grd", "<cmd>Trouble lsp_definitions auto_jump=true<CR>", desc = "LSP Definitions" },
    { "grD", "<cmd>Trouble lsp_type_definitions auto_jump=true<CR>", desc = "LSP Type Definitions" },
    { "grc", "<cmd>Trouble lsp_incoming_calls<CR>", desc = "LSP Incoming Calls" },
    { "grC", "<cmd>Trouble lsp_outgoing_calls<CR>", desc = "LSP Outgoing Calls" },
    { "gO", "<cmd>Trouble lsp_document_symbols<CR>", desc = "LSP Document Symbols" },
  },
}
