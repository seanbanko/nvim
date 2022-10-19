local opts = { silent = true } -- don't display the command called when a keymap is triggered

vim.keymap.set("", "<space>", "<nop>", opts)
vim.g.mapleader = " "

vim.keymap.set("i", ",", ",<C-g>u", opts) -- undo breakpoints
vim.keymap.set("i", ".", ".<C-g>u", opts) -- undo breakpoints
vim.keymap.set("i", ";", ";<C-g>u", opts) -- undo breakpoints
vim.keymap.set("n", "<C-f>", "/", opts) -- search with Ctrl-F
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", opts) -- save with Ctrl-S
vim.keymap.set("n", "<c-h>", "<cmd>wincmd h<CR>", opts) -- better window navigation
vim.keymap.set("n", "<c-j>", "<cmd>wincmd j<CR>", opts) -- better window navigation
vim.keymap.set("n", "<c-k>", "<cmd>wincmd k<CR>", opts) -- better window navigation
vim.keymap.set("n", "<c-l>", "<cmd>wincmd l<CR>", opts) -- better window navigation
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr><esc>", opts) -- clear search highlights with esc
vim.keymap.set("n", "<leader>wc", "<cmd>w !wc<CR>", opts) -- get word count of current buffer
vim.keymap.set("n", "\\", "<C-^>", opts) -- use backslash '\' for alternate file
vim.keymap.set("n", "q:", "<nop>", opts) -- disable annoying message if you accidentally press 'q:' not ':q'
vim.keymap.set("n", "x", "\"_x", opts) -- x to black hole register so x doesn't overwrite the clipboard register
vim.keymap.set("v", "<", "<gv", opts) -- stay in visual mode after indenting
vim.keymap.set("v", ">", ">gv", opts) -- stay in visual mode after indenting 
vim.keymap.set("v", "p", '"_dP', opts) -- persistent paste

-- Plugins

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts) -- Telescope
vim.keymap.set("n", "<leader>lg", "<cmd>Telescope live_grep<CR>", opts) -- Telescope
vim.keymap.set("n", "<leader>cs", "<cmd>Telescope colorscheme<CR>", opts) -- Telescope
vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", opts) -- ZenMode
vim.keymap.set("n", "<leader>x", "<cmd>Format<CR>", opts) -- Format with null-ls
