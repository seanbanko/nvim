return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      vim.cmd.colorscheme("catppuccin-macchiato")
    end
  },
  {
    "sainnhe/everforest",
    config = function()
      vim.cmd [[ let g:everforest_background='soft' ]]
    end
  },
  "projekt0n/github-nvim-theme",
  "rose-pine/neovim",
  "shaunsingh/nord.nvim",
  "navarasu/onedark.nvim",
  'Mofiqul/vscode.nvim',
  "folke/tokyonight.nvim",
}
