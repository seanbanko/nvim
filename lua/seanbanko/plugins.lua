local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing Packer. Close and relaunch Neovim.")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- Packer
	use({ "wbthomason/packer.nvim" })
	use({ "nvim-lua/plenary.nvim" })
	-- Colorschemes
	use({ "projekt0n/github-nvim-theme" })
	use({ "shaunsingh/nord.nvim" })
	use({ "rose-pine/neovim" })
	use({ "catppuccin/nvim", as = "catppuccin" })
	-- Autocompletion and Snippets
	use({ "L3MON4D3/LuaSnip" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/nvim-cmp" })
	use({ "rafamadriz/friendly-snippets" })
	use({ "saadparwaiz1/cmp_luasnip" })
	-- LSP
	use({ "neovim/nvim-lspconfig" })
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "RRethy/vim-illuminate" })
	-- Telescope
	use({ "nvim-telescope/telescope.nvim" })
	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter" })
	use({ "nvim-treesitter/nvim-treesitter-textobjects" })
	-- Git
	use({ "lewis6991/gitsigns.nvim" })
	-- DAP (Debugging)
	use({ "mfussenegger/nvim-dap" })
	use({ "rcarriga/nvim-dap-ui" })
	use({ "ravenxrz/DAPInstall.nvim" })
	-- Misc
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use({ "ellisonleao/glow.nvim" })
	use({ "folke/twilight.nvim" })
	use({ "folke/which-key.nvim" })
	use({ "folke/zen-mode.nvim" })
	use({ "lervag/vimtex" })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "nvim-lualine/lualine.nvim" })
	use({ "tpope/vim-surround" })
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
