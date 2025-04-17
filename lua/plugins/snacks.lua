return {
  "folke/snacks.nvim",
  lazy = false,
  opts = {
    explorer = { enabled = true },
    gitbrowse = { enabled = true },
    picker = { enabled = true },
    terminal = { enabled = true },
  },
  keys = {
    { "<leader>nt", function() Snacks.explorer() end,  desc = "File Explorer" },
    { "<leader>go", function() Snacks.gitbrowse() end, desc = "Git Browse",   mode = { "n", "v" } },
    { "<leader>t",  function() Snacks.terminal() end,  desc = "Terminal",     mode = "n" },
  }
}
