return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    theme = "moonfly",
    icons_enable = true,
    sections = {
      lualine_b = {},
      lualine_c = {
        { "filename", path = 1 },
      },
      lualine_x = {
        { "lsp_status" },
      },
      lualine_y = {
        { "diagnostics", sections = { "error", "warn", "info" } },
        { "diff", symbols = { added = " ", modified = " ", removed = " " } },
      },
      lualine_z = {
        { "branch" },
      },
    },
  },
}
