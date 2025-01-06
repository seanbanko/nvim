return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { 'saghen/blink.cmp' },
  },
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
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "simrat39/rust-tools.nvim",
    },
  },
  { 'j-hui/fidget.nvim', opts = {} },
  { "folke/neodev.nvim", opts = {} },
  "folke/neoconf.nvim",
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
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
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
  {
    'MeanderingProgrammer/markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },

    config = function()
      require('render-markdown').setup({})
    end,
  },
  {
    'https://github.com/tpope/vim-fugitive',
    dependencies = {
      'https://github.com/tpope/vim-rhubarb',
      'https://github.com/shumphrey/fugitive-gitlab.vim',
    },
    keys = {
      { "<leader>go", "<cmd>GBrowse<cr>", mode = { "n" }, silent = true },
      { "<leader>go", ":GBrowse<cr>",     mode = { "v" }, silent = true },
    },
  },
  "https://github.com/towolf/vim-helm",
}
