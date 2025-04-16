return {
  "rmagatti/auto-session",
  lazy = false,
  keys = {
    { "<leader>ls", function() require("auto-session.session-lens").search_session() end, mode = "n", silent = true },
  },
  dependencies = {
    "folke/snacks.nvim",
  },
  config = function()
    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
    require('auto-session').setup {
      post_restore_cmds = { "lua Snacks.explorer()" },
      suppressed_dirs = { "~" },
    }
  end
}
