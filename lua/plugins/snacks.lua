return {
  "folke/snacks.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  priority = 1000,
  opts = {
    explorer = { enabled = true },
    gitbrowse = { enabled = true },
    picker = {
      enabled = true,
      hidden = true,
      ignored = true,
    },
    terminal = { enabled = true },
  },
  keys = {
    { "<leader>e",  function() Snacks.explorer() end,  desc = "File Explorer" },
    { "<leader>go", function() Snacks.gitbrowse() end, desc = "Git Browse",   mode = { "n", "v" } },
    {
      "<leader>fo",
      function() Snacks.picker.files({ hidden = false, ignored = true, layout = "dropdown" }) end,
      desc = "Find files",
    },
    {
      "<leader>lg",
      function() Snacks.picker.grep({ layout = "dropdown" }) end,
      desc = "Live grep",
    },
    { "<leader>di", function() Snacks.picker.diagnostics() end,  desc = "Diagnostics" },
    { "<leader>cs", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
    {
      "<leader>gw",
      function() Snacks.picker.grep_word() end,
      desc = "Grep word",
      mode = { "n", "x" },
    },
  },
}
