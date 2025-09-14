return {
  "folke/snacks.nvim",
  depdencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  opts = {
    explorer = { enabled = true },
    gitbrowse = { enabled = true },
    picker = {
      enabled = true,
      hidden = true,
    },
    terminal = { enabled = true },
  },
  keys = {
    { "<leader>t",  function() Snacks.explorer() end,  desc = "File Explorer" },
    { "<leader>go", function() Snacks.gitbrowse() end, desc = "Git Browse",   mode = { "n", "v" } },
  }
}
