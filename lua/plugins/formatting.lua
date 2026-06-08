return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      bash = { "shfmt" },
      buf = { "buf" },
      go = { "goimports", "gofumpt" },
      json = { "prettier" },
      lua = { "stylua" },
      markdown = { "prettier" },
      python = { "ruff_format" },
      rust = { "rustfmt" },
      sh = { "shfmt" },
      terraform = { "terraform_fmt" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
    },
    format_on_save = {
      lsp_format = "fallback",
      timeout_ms = 500,
    },
    notify_on_error = false,
  },
}
