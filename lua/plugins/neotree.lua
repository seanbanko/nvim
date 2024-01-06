return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    close_if_last_window = true,
    follow_current_file = {
      enabled = true,
      leave_dirs_open = true,
    },
  },
  keys = {
    { "<leader>nt", "<cmd>Neotree toggle reveal=true <cr>", mode = "n", silent = true },
  }
}
