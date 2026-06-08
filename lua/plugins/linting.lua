return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      bash = { "shellcheck" },
      go = { "golangcilint" },
      python = { "ruff" },
      sh = { "shellcheck" },
    }
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "BufEnter", "InsertLeave", "TextChanged" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
