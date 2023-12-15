return {
  "nvim-telescope/telescope.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  keys = {
    { "<leader>fo", function() require("telescope.builtin").find_files() end,  mode = "n", silent = true, },
    { "<leader>lg", function() require("telescope.builtin").live_grep() end,   mode = "n", silent = true, },
    { "<leader>di", function() require("telescope.builtin").diagnostics() end, mode = "n", silent = true, },
    { "<leader>cs", function() require("telescope.builtin").colorscheme() end, mode = "n", silent = true, },
    { "<leader>gw", function() require("telescope.builtin").grep_string() end, mode = "n", silent = true, },
  },
}
