return {
  -- LSP
  "neovim/nvim-lspconfig",
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        }
      }
    },
  },
  "williamboman/mason-lspconfig.nvim",
  { 'j-hui/fidget.nvim', opts = {} },
  { "folke/neodev.nvim", opts = {} },
  "folke/neoconf.nvim",
  -- LSP Misc
  "mfussenegger/nvim-ansible",
  "lervag/vimtex",
  {
    "numToStr/Comment.nvim",
    config = true,
  },
  "RRethy/vim-illuminate",
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = true,
  },
  "lukas-reineke/indent-blankline.nvim",
  "tpope/vim-surround",
  "sindrets/diffview.nvim",
  {
    "simrat39/symbols-outline.nvim",
    config = true,
    keys = { { "<leader>so", "<cmd>SymbolsOutline<cr>", mode = "n", silent = true } },
  },
  {
    "https://codeberg.org/esensar/nvim-dev-container",
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {
      attach_mounts = {
        neovim_config = {
          enabled = true,
          options = { "readonly" },
        },
      },
    }
  },
}
