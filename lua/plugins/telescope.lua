return {
  "nvim-telescope/telescope.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  opts = {
    pickers = {
      find_files = {
        theme = "dropdown",
        layout_config = {
          width = 0.75
        },
        fuzzy = false,
      },
      live_grep = {
        theme = "dropdown",
        layout_config = {
          width = 0.75
        }
      },
    },
  },
  keys = {
    {
      "<leader>fo",
      function()
        require("telescope.builtin").find_files({
          hidden = true,
          no_ignore = true,
        })
      end,
      mode = "n",
      silent = true,
    },
    { "<leader>lg", function() require("telescope.builtin").live_grep() end,   mode = "n", silent = true, },
    { "<leader>di", function() require("telescope.builtin").diagnostics() end, mode = "n", silent = true, },
    { "<leader>cs", function() require("telescope.builtin").colorscheme() end, mode = "n", silent = true, },
    { "<leader>gw", function() require("telescope.builtin").grep_string() end, mode = "n", silent = true, },
  },
}
