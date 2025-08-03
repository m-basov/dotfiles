return {
  "neovim/nvim-lspconfig",
  version = "^2.3.0",
  config = function()
    vim.diagnostic.config({
      severity_sort = true,
      signs = {
        severity = { min = vim.diagnostic.severity.INFO },
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅚 ",
          [vim.diagnostic.severity.WARN] = "󰀪 ",
          [vim.diagnostic.severity.INFO] = "󰋽 ",
        },
      },
      virtual_text = {
        severity = { min = vim.diagnostic.severity.ERROR },
        current_line = true,
      },
      underline = false,
      virtual_lines = false,
    })

    vim.lsp.config("vtsls", {
      settings = {
        typescript = {
          tsserver = {
            -- Search for plugins in local node_modules
            pluginPaths = { "./node_modules" },
          },
        },
        vtsls = {
          autoUseWorkspaceTsdk = true,
          experimental = {
            completion = {
              enableServerSideFuzzyMatch = true,
              entriesLimit = 100,
            },
          },
        },
      },
    })

    vim.lsp.enable({ "lua_ls", "vtsls", "eslint" })
  end,
}
