return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      go = { "goimports", "gofumpt" },
      json = { "prettier" },
    },
    format_on_save = {
      lsp_fallback = true,
      timeout_ms = 500,
    },
  },
}
