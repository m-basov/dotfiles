return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    theme = "moonfly",
    icons_enable = true,
    sections = {
      lualine_b = {
        { "branch" },
        { "diff", symbols = { added = " ", modified = " ", removed = " " } },
        { "diagnostics", sections = { "error", "warn", "info" } },
      },
      lualine_c = {
        { "filename", path = 1 },
      },
      lualine_y = {
        { "lsp_status" },
      },
    },
  },
}
