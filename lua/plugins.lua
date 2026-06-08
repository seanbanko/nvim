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
  "williamboman/mason-lspconfig.nvim",
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
    ft = { "rust" },
    init = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(_, bufnr)
            vim.keymap.set("n", "K", function()
              vim.cmd.RustLsp({ "hover", "actions" })
            end, { buffer = bufnr, desc = "Rust hover actions" })
          end,
        },
      }
    end,
  },
  { 'j-hui/fidget.nvim', opts = {} },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  "folke/neoconf.nvim",
  "mfussenegger/nvim-ansible",
  "lervag/vimtex",
  "lukas-reineke/indent-blankline.nvim",
  "tpope/vim-surround",
  "sindrets/diffview.nvim",
  {
    "hedyhli/outline.nvim",
    config = true,
    keys = { { "<leader>so", "<cmd>Outline<cr>", mode = "n", silent = true, desc = "Symbols outline" } },
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
  "https://github.com/towolf/vim-helm",
  { "nvim-tree/nvim-web-devicons", opts = {} },
  {
    "benomahony/uv.nvim",
    opts = {
      picker_integration = true,
    },
  }
}
