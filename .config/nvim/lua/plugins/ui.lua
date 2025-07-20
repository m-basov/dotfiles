return {
  {
    "snacks.nvim",
    opts = function(_, opts)
      opts.indent = { enabled = false }
      opts.words = { enabled = false }
    end,
  },
  {
    "lualine.nvim",
    opts = function(_, opts)
      opts.sections.lualine_z = {}
    end,
  },
}
