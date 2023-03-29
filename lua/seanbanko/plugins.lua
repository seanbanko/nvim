local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Colorschemes
  { "catppuccin/nvim", name = "catppuccin" },
  "folke/tokyonight.nvim",
  "projekt0n/github-nvim-theme",
  "rose-pine/neovim",
  "shaunsingh/nord.nvim",
  -- Autocompletion and Snippets
  "L3MON4D3/LuaSnip",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-path",
  "hrsh7th/nvim-cmp",
  "rafamadriz/friendly-snippets",
  "saadparwaiz1/cmp_luasnip",
  -- LSP
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "jose-elias-alvarez/null-ls.nvim",
  "RRethy/vim-illuminate",
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    keys = {
      {
        "<leader>ff",
        "<cmd>Telescope find_files<cr>",
        mode = "n",
        silent = true,
      },
      {
        "<leader>lg",
        "<cmd>Telescope live_grep<cr>",
        mode = "n",
        silent = true,
      },
      {
        "<leader>di",
        "<cmd>Telescope diagnostics<cr>",
        mode = "n",
        silent = true,
      },
      {
        "<leader>cs",
        "<cmd>Telescope colorscheme<cr>",
        mode = "n",
        silent = true,
      },
      {
        "<leader>/",
        "<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending<cr>",
        mode = "n",
        silent = true,
      },
    },
  },
  -- Treesitter
  "nvim-treesitter/nvim-treesitter",
  "nvim-treesitter/nvim-treesitter-textobjects",
  -- Git
  "lewis6991/gitsigns.nvim",
  -- DAP (Debugging)
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  "ravenxrz/DAPInstall.nvim",
  -- Misc
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
  "ellisonleao/glow.nvim",
  "folke/twilight.nvim",
  "folke/which-key.nvim",
  {
    "folke/zen-mode.nvim",
    keys = {
      { "<leader>z", "<cmd>ZenMode<cr>", mode = "n", silent = true },
    },
  },
  "lervag/vimtex",
  "lukas-reineke/indent-blankline.nvim",
  "nvim-lualine/lualine.nvim",
  "tpope/vim-surround",
  {
    "akinsho/flutter-tools.nvim",
    dependencies = "nvim-lua/plenary.nvim",
  },
  {
    "gaoDean/autolist.nvim",
    ft = {
      "markdown",
      "text",
      "tex",
      "plaintex",
    },
    config = function()
      local autolist = require("autolist")
      autolist.setup()
      autolist.create_mapping_hook("i", "<CR>", autolist.new)
      autolist.create_mapping_hook("i", "<Tab>", autolist.indent)
      autolist.create_mapping_hook("i", "<S-Tab>", autolist.indent, "<C-D>")
      autolist.create_mapping_hook("n", "o", autolist.new)
      autolist.create_mapping_hook("n", "O", autolist.new_before)
      autolist.create_mapping_hook("n", ">>", autolist.indent)
      autolist.create_mapping_hook("n", "<<", autolist.indent)
      autolist.create_mapping_hook("n", "<C-r>", autolist.force_recalculate)
      autolist.create_mapping_hook("n", "<leader>x", autolist.invert_entry, "")
      vim.api.nvim_create_autocmd("TextChanged", {
        pattern = "*",
        callback = function()
          vim.cmd.normal({ autolist.force_recalculate(nil, nil), bang = false })
        end,
      })
    end,
  },
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    },
  },
})
