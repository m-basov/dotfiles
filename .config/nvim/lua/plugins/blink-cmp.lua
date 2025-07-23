return {
  "saghen/blink.cmp",
  version = "^1.5.1",
  event = "VeryLazy",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "super-tab" },
    appearance = { nerd_font_variant = "mono" },
    completion = { documentation = { auto_show = true } },
    sources = { default = { "lsp", "path", "snippets", "buffer" } },
    fuzzy = { implementation = "rust" },
  },
  opts_extend = { "sources.default" },
}
