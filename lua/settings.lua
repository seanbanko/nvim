local indent = 4

vim.opt.autoindent = true -- Match indentation level from previous line
vim.opt.autowrite = true -- Automatically write buffers
vim.opt.belloff = "all" -- TODO default
vim.opt.breakindent = true -- Visually indent broken lines
vim.opt.confirm = true -- Prompt to write before quitting
vim.opt.clipboard = "unnamedplus" -- Use system clipboard instead of vim clipboard by default
vim.opt.cursorline = true -- Enable highlighting the current line
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.guifont = "Liga SFMono Nerd Font:h12"
vim.opt.hidden = true -- Allow hiding unsaved buffers
vim.opt.hlsearch = true -- TODO default Highlight matches
vim.opt.ignorecase = true -- Case-insensitive search by default
vim.opt.inccommand = "nosplit" -- Preview commands while typing them
vim.opt.incsearch = true -- TODO default Live preview search matches
vim.opt.joinspaces = false -- Don't add a space after join
vim.opt.linebreak = true
vim.opt.mouse = "a" -- Enable the mouse in all modes
vim.opt.number = true
vim.opt.pumblend = 15 -- Popup menu blending (transparency)
vim.opt.relativenumber = true -- Show hybrid relative line numbers
vim.opt.scrolloff = 4 -- Always display at least <scrolloff> lines above/below the cursor
vim.opt.sidescrolloff = 4 -- Always display this many columns on the side of the cursor
vim.opt.shiftwidth = indent -- Number of characters used for auto-indenting
vim.opt.shortmess = "IToOlxfitn" -- TODO what does this actually do?
vim.opt.showbreak = "+++"
vim.opt.smartcase = true -- Case sensitive search if it contains an uppercase letter
vim.opt.smarttab = true -- TODO default. also what does this actually do?
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.softtabstop = indent -- Number of characters a tab inserts in insert mode
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = indent -- Number of characters a tab counts for
vim.opt.termguicolors = true -- True color support
vim.opt.timeoutlen = 500
vim.opt.updatetime = 500
vim.opt.wildignore = vim.opt.wildignore + { "*.o", "*~", "*.pyc", "*pycache*" }
vim.opt.wildmode = { "list", "full" }
vim.opt.wrap = true

-- Sensible autoformatting options [@tjdevries]
vim.opt.formatoptions = vim.opt.formatoptions
  - "a" -- Auto formatting is BAD.
  - "t" -- Don't auto format my code. I got linters for that.
  + "c" -- In general, I like it when comments respect textwidth
  + "q" -- Allow formatting comments w/ gq
  - "o" -- O and o, don't continue comments
  + "r" -- But do continue when pressing enter.
  + "n" -- Indent past the formatlistpat, not underneath it.
  + "j" -- Auto-remove comments if possible.
  - "2" -- I'm not in gradeschool anymore

-- Disable builtin plugins [@folke]
vim.g.loaded_2html_plugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zipPlugin = 1

-- Show cursor line only in active window [@folke]
vim.cmd([[
  autocmd InsertLeave,WinEnter * set cursorline
  autocmd InsertEnter,WinLeave * set nocursorline
]])

-- Check if we need to reload the file when it changed [@folke]
vim.cmd("au FocusGained * :checktime")

-- Highlight on yank [@folke]
vim.cmd("au TextYankPost * lua vim.highlight.on_yank {}")

-- Close certain windows with q [@folke]
vim.cmd([[autocmd FileType help,startuptime,qf,lspinfo nnoremap <buffer><silent> q :close<CR>]])
vim.cmd([[autocmd FileType man nnoremap <buffer><silent> q :quit<CR>]])
