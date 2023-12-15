return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      backdrop = 1,
      width = 0.5,
      height = 1,
    },
  },
  keys = { { "<leader>z", function() require("zen-mode").toggle() end, mode = "n", silent = true } },
}
