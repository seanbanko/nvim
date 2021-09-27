-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

-- Recompile packer if init.lua is modified
vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)
local use = require("packer").use
require("packer").startup(function()

    use { "wbthomason/packer.nvim" } -- Package manager

    use {
          "shaunsingh/nord.nvim",
          config = function()
             vim.cmd [[colorscheme nord]]
          end,
   }

    use { "tpope/vim-commentary" } -- "gc" to comment visual regions/lines
    use { "tpope/vim-surround" } -- Surround textobjects
    use { "ThePrimeagen/vim-be-good" }
    use { "folke/twilight.nvim" }
    use { "folke/which-key.nvim" }
    use { "folke/zen-mode.nvim" }

    use {
        "hoob3rt/lualine.nvim",
        -- config = function()
        --     require("config/lualine").setup()
        -- end,
    } 

    -- Telescope
    use { "nvim-lua/plenary.nvim" } -- Dependency 
    use { "nvim-telescope/telescope.nvim", requires = { 'nvim-lua/plenary.nvim' } }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = 'make' }

    -- LSP
    
    -- Collection of configurations for built-in LSP client
    use { 
        "neovim/nvim-lspconfig",
        -- config = function()
        --     require("config/lsp")
        -- end,
    }

    -- Autocompletion plugin
    use { "hrsh7th/nvim-cmp" } 

    -- Autocompletion
    -- use{  "hrsh7th/cmp-nvim-lsp" }

    -- use {
    --   "glepnir/lspsaga.nvim",
    --   config = function()
    --     require("config.lspsaga").setup()
    --   end,
    -- }
    -- use {
    --   "onsails/lspkind-nvim",
    --   config = function()
    --     require("lspkind").init()
    --   end,
    -- }

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        opt = true,
        event = "BufRead",
        requires = "nvim-treesitter/nvim-treesitter-textobjects",
        config = [[require('config/treesitter')]],
    }

end)

-- Plugins to Try
    -- use vim-pencil
    -- firenvim
    -- signify or gitsigns or something for git
    -- use "glepnir/lspsaga.nvim" -- what does this even do?
    -- use "saadparwaiz1/cmp_luasnip"
    -- use "L3MON4D3/LuaSnip" -
    -- DAP
    -- vimspector
    -- use "tpope/vim-dispatch" 
    -- use "tpope/vim-fugitive" -- Git commands in nvim
    -- use "tpope/vim-rhubarb" -- Fugitive-companion to interact with github
    -- use "lukas-reineke/indent-blankline.nvim" -- Add indentation guides even on blank lines
    -- use { "lewis6991/gitsigns.nvim", requires = { 'nvim-lua/plenary.nvim' } }
    -- use "True Zen"
    -- use glow
    -- vim-maximizer
    -- use "folke/trouble.nvim"
    -- use "folke/todo-comments.nvim"
    -- use "dashboard-nvim"
