return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    spec = {
      { "<leader>c", group = "code" },
      { "<leader>d", group = "debug/diagnostics" },
      { "<leader>f", group = "find" },
      { "<leader>g", group = "git" },
      { "<leader>l", group = "lsp/session" },
      { "<leader>o", group = "obsidian" },
      { "<leader>r", group = "rename" },
      { "<leader>t", group = "toggle" },
    },
  },
  keys = {
    {
      "<leader>?",
      function() require("which-key").show({ global = false }) end,
      desc = "Buffer keymaps",
    },
  },
}
