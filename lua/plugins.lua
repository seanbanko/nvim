local function packer_init()
  local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.api.nvim_command("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  end
  vim.cmd "packadd! packer.nvim"
  vim.cmd "autocmd BufWritePost plugins.lua PackerCompile"
end

packer_init()

require("packer").startup({function()
    -- Packer
    use { "wbthomason/packer.nvim" }
    use { "lukas-reineke/indent-blankline.nvim" }
    -- Colorschemes
    use { "projekt0n/github-nvim-theme" }
    use { "shaunsingh/nord.nvim" }
    use { "rose-pine/neovim" }

    -- No inline config
    use { "tpope/vim-commentary" }
    use { "tpope/vim-surround" }
    use { "voldikss/vim-floaterm" }
    use { "ThePrimeagen/vim-be-good" }
    use { "folke/twilight.nvim" }
    use { "folke/which-key.nvim" }

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter" }
    use { "nvim-treesitter/nvim-treesitter-textobjects" }

    -- Telescope
    use { "nvim-telescope/telescope.nvim", requires = { 'nvim-lua/plenary.nvim' } }

    -- LSP
    use { 
        "neovim/nvim-lspconfig",
        config = function() 
            require("config/lspconfig") 
        end, 
    }

    -- Cmp
    use { "hrsh7th/nvim-cmp", 
        config = function() 
            require("config/cmp") 
        end, 
    }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "saadparwaiz1/cmp_luasnip" }
    use { "L3MON4D3/LuaSnip" }

    -- Lualine

    -- use { "nvim-lualine/lualine.nvim",
    --   requires = { "kyazdani42/nvim-web-devicons", opt = true }
    --   config = function()
    --       require("config/lualine")
    --   end,
    -- }

    -- Zen Mode
    use {
        "folke/zen-mode.nvim",
        config = function()
            require("config/zen-mode")
        end,
    }

  end,

  config = {
      display = {
          open_fn = function()
              return require('packer.util').float({border = 'single'})
          end
      }
  }

})

-- Plugins to Try
-- vim-pencil
-- lualine
-- signify or gitsigns or something for git sidebar
-- "glepnir/lspsaga.nvim" -- what does this even do?
-- DAP
-- vimspector
-- "tpope/vim-dispatch" 
-- "tpope/vim-fugitive" -- Git commands in nvim
-- "tpope/vim-rhubarb" -- Fugitive-companion to interact with github
-- "lukas-reineke/indent-blankline.nvim" -- Add indentation guides even on blank lines
-- { "lewis6991/gitsigns.nvim", requires = { 'nvim-lua/plenary.nvim' } }
-- "True Zen"
-- glow
-- vim-maximizer
-- "folke/trouble.nvim"
-- "folke/todo-comments.nvim"
-- "dashboard-nvim"
