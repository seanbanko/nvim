return {
  "catppuccin/nvim",
  {
    "sainnhe/everforest",
    config = function()
      vim.cmd [[ let g:everforest_background='soft' ]]
    end
  },
  "projekt0n/github-nvim-theme",
  {
    "rose-pine/neovim",
    config = function()
      vim.cmd.colorscheme("rose-pine-moon")
    end
  },
  "shaunsingh/nord.nvim",
  "navarasu/onedark.nvim",
  'Mofiqul/vscode.nvim',
  "folke/tokyonight.nvim",
}
