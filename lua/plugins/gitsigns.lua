return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
  },
  keys = {
    { "<leader>tgb", function() require("gitsigns").toggle_current_line_blame() end, mode = "n", silent = true },
    { "<leader>gb",  function() require("gitsigns").blame_line() end,                mode = "n", silent = true },
  },
}
