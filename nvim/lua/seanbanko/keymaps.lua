local opts = { silent = true } -- don't display the command called when a keymap is triggered

vim.keymap.set("", "<space>", "<nop>", opts)
vim.g.mapleader = " "

-- undo breakpoints
vim.keymap.set("i", ",", ",<c-g>u", opts)
vim.keymap.set("i", ".", ".<c-g>u", opts)
vim.keymap.set("i", ";", ";<c-g>u", opts)

-- better window navigation
vim.keymap.set("n", "<c-h>", "<cmd>wincmd h<cr>", opts)
vim.keymap.set("n", "<c-j>", "<cmd>wincmd j<cr>", opts)
vim.keymap.set("n", "<c-k>", "<cmd>wincmd k<cr>", opts)
vim.keymap.set("n", "<c-l>", "<cmd>wincmd l<cr>", opts)

-- resize window using <ctrl>+arrow keys
vim.keymap.set("n", "<c-up>", "<cmd>resize +2<cr>", opts)
vim.keymap.set("n", "<c-down>", "<cmd>resize -2<cr>", opts)
vim.keymap.set("n", "<c-left>", "<cmd>vertical resize -2<cr>", opts)
vim.keymap.set("n", "<c-right>", "<cmd>vertical resize +2<cr>", opts)

-- stay in visual mode after indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr><esc>", opts) -- clear search highlights with esc
vim.keymap.set("n", "\\", "<c-^>", opts)                       -- use backslash '\' for alternate file

vim.keymap.set("n", "<c-f>", "/", opts)                        -- search with ctrl-f
vim.keymap.set("n", "<c-s>", "<cmd>w<cr>", opts)               -- save with ctrl-s

vim.keymap.set("v", "p", '"_dp', opts)                         -- persistent paste
vim.keymap.set("n", "x", '"_x', opts)                          -- x to black hole register so x doesn't overwrite the clipboard register

vim.keymap.set("n", "q:", "<nop>", opts)                       -- disable annoying message if you accidentally type 'q:' not ':q'
vim.keymap.set("n", "q", "<nop>", opts)                        -- stop accientally recording macros

vim.keymap.set("n", "<leader>wc", "<cmd>w !wc<cr>", opts)      -- get word count of current buffer
