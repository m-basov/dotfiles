return {
  {
    "conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = {
        lua = { "stylua" },
        typescript = { "prettierd", "prettier" },
        javascript = { "prettierd", "prettier" },
      }
    end,
  },
}
