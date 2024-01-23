return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      go = { "golangcilint" },
    }
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "TextChanged" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
