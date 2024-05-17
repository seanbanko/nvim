return {
  "rmagatti/auto-session",
  lazy = false,
  keys = {
    { "<leader>ls", function() require("auto-session.session-lens").search_session() end, mode = "n", silent = true },
  },
  dependencies = {
    "nvim-neo-tree/neo-tree.nvim",
  },
  config = function()
    vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
    require('auto-session').setup {
      pre_save_cmds = { "Neotree close" },
      post_restore_cmds = { "Neotree action=show source=filesystem reveal=true" },
      auto_session_suppress_dirs = { "~" },
    }
  end
}
