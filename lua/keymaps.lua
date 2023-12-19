vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opts = { silent = true }

-- undo breakpoints
vim.keymap.set("i", ",", ",<c-g>u", opts)
vim.keymap.set("i", ".", ".<c-g>u", opts)
vim.keymap.set("i", ";", ";<c-g>u", opts)

-- better window navigation
vim.keymap.set("n", "<c-h>", "<cmd>wincmd h<cr>", opts)
vim.keymap.set("n", "<c-j>", "<cmd>wincmd j<cr>", opts)
vim.keymap.set("n", "<c-k>", "<cmd>wincmd k<cr>", opts)
vim.keymap.set("n", "<c-l>", "<cmd>wincmd l<cr>", opts)

-- stay in visual mode after indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- clear search highlights with esc
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr><esc>", opts)

-- use backslash '\' for alternate file
vim.keymap.set("n", "\\", "<c-^>", opts)

-- intuitive visual mode paste
vim.keymap.set("v", "p", '"_dP', opts)

-- don't overwrite the clipboard with x
vim.keymap.set("n", "x", '"_x', opts)

-- disable annoying message if you accidentally type 'q:' not ':q'
vim.keymap.set("n", "q:", "<nop>", opts)

-- get word count of current buffer
vim.keymap.set("n", "<leader>wc", "<cmd>w !wc<cr>", opts)
