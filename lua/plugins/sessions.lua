return {
  "rmagatti/auto-session",
  lazy = false,
  keys = {
    { "<leader>ls", function() require("auto-session.session-lens").search_session() end, mode = "n", silent = true },
  },
  config = function()
    require("auto-session").setup()
  end
}
