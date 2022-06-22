-- [@shaunsingh]
local function map(mode, lhs, rhs, opts)
   local options = { noremap = true, silent = true }
   if opts then
      options = vim.tbl_extend("force", options, opts)
   end
   vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("", "<space>", "<nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "q:", "<nop>")

map("n", "\\", "<C-^>")

map("n", "<c-k>", "<cmd>wincmd k<CR>")
map("n", "<c-j>", "<cmd>wincmd j<CR>")
map("n", "<c-h>", "<cmd>wincmd h<CR>")
map("n", "<c-l>", "<cmd>wincmd l<CR>")

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

-- Persistent paste
map("v", "p", '"_dP')

 -- Telescope
map("n", "<leader>f", "<cmd>Telescope find_files<CR>")
map("n", "<leader>s", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>cs", "<cmd>Telescope colorscheme<CR>")

-- Format (calls null-ls)
map("n", "<leader>x", "<cmd>Format<CR>")

-- ZenMode
map("n", "<leader>z", "<cmd>ZenMode<CR>")

-- Packer
map("n", "<leader>ps", "<cmd>PackerSync<CR>")
map("n", "<leader>pc", "<cmd>PackerCompile<CR>")

-- Floatterm
map("n", "<leader>t", "<cmd>FloatermNew<CR>")

-- PlatformIO
map("n", "<leader>pr", "<cmd>!pio run --target upload<CR>")
map("n", "<leader>pd", "<cmd>!pio device monitor<CR>")

map("n", "k", "gk")
map("n", "j", "gj")

map("n", "<leader>rp", "<cmd>lua require('rose-pine').toggle()<CR>")

map("n", "ZZ", "<cmd>xa<CR>")

map("n", "<leader>wc", "<cmd>w !wc<CR>")

-- x to black hole register
map("n", "x", "\"_x")
