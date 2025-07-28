return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  version = "^9.0.0",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },

      javascript = { "eslint_d", "prettierd" },
      javascriptreact = { "eslint_d", "prettierd" },

      typescript = { "eslint_d", "prettierd" },
      typescriptreact = { "eslint_d", "prettierd" },

      json = { "prettierd" },
      jsonc = { "prettierd" },
    },
    format_on_save = {
      timeout_ms = 1000,
      lsp_format = "fallback",
    },
  },
}
