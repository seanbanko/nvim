-- [@shaunsingh]
local function map(mode, lhs, rhs, opts)
   local options = { noremap = true, silent = true }
   if opts then
      options = vim.tbl_extend("force", options, opts)
   end
   vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = " "

map("n", "<c-k>", "<cmd>wincmd k<CR>") --ctrlhjkl to navigate splits
map("n", "<c-j>", "<cmd>wincmd j<CR>")
map("n", "<c-h>", "<cmd>wincmd h<CR>")
map("n", "<c-l>", "<cmd>wincmd l<CR>")

-- Switch to previous bufffer

map("n", "\\", "<C-^>")
map("n", "<esc>", "<cmd>nohlsearch<cr><esc>")

-- Undo breakpoints
map("i", ",", ",<C-g>u")
map("i", ".", ".<C-g>u")
map("i", ";", ";<C-g>u")

-- (g)oto (w)ord
map("n", "gw", "*N") 
map("x", "gw", "*N")

map("n", "<C-f>", "/") -- Ctrl-F initiates search
map("n", "<C-s>", "<cmd>w<cr>") -- Ctrl-S saves the buffer

 -- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")
 
 -- Move lines
map("n", "<A-j>", "<cmd>m .+1<CR>==")
map("n", "<A-k>", "<cmd>m .-2<CR>==")
map("v", "<A-j>", "<cmd>m '>+1<CR>gv=gv")
map("v", "<A-k>", "<cmd>m '<-2<CR>gv=gv")

 -- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<leader>fb", "<cmd>Telescope file_browser<CR>")
map("n", "<leader>bb", "<cmd>Telescope buffers<CR>")
