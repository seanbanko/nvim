return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      buf = { "buf" },
      go = { "goimports", "gofumpt" },
      json = { "prettier" },
      markdown = { "prettier" },
      rust = { "rustfmt" },
    },
    format_on_save = {
      lsp_fallback = true,
      timeout_ms = 500,
    },
    notify_on_error = false,
  },
}
