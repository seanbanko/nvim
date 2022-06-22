-- General
vim.opt.confirm = true
vim.opt.clipboard = "unnamedplus"
vim.opt.hidden = true
vim.opt.inccommand = "nosplit"
vim.opt.joinspaces = false
vim.opt.ruler = false
vim.opt.shortmess = "IToOlxfitn" -- TODO actually think about this
vim.opt.termguicolors = true

-- Tabs and Spacing
local indent = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = indent
vim.opt.softtabstop = indent
vim.opt.tabstop = indent
vim.cmd([[autocmd FileType c,lua setlocal shiftwidth=2 tabstop=2 softtabstop=2]])

-- Search
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.wildmode = { "longest", "full" }

-- Appearance
vim.opt.linebreak = true
vim.opt.number = true
vim.opt.pumblend = 15
vim.opt.relativenumber = true
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = true

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

-- Don't overwrite my format options
vim.cmd([[au BufWinEnter * setlocal formatoptions-=cro]])

-- Check if we need to reload the file when it changed [@folke]
vim.cmd("au FocusGained * :checktime")

-- Highlight on yank [@folke]
vim.cmd("au TextYankPost * lua vim.highlight.on_yank {}")

-- Close certain windows with q [@folke]
vim.cmd([[autocmd FileType help,startuptime,qf,lspinfo nnoremap <buffer><silent> q :close<CR>]])
vim.cmd([[autocmd FileType man nnoremap <buffer><silent> q :quit<CR>]])
