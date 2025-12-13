return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  version = "^9.0.0",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },

      javascript = { "prettier" },
      javascriptreact = { "prettier" },

      typescript = { "prettier" },
      typescriptreact = { "prettier" },

      json = { "prettier" },
      jsonc = { "prettier" },

      markdown = { "prettier" },

      go = { "gofmt" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}
