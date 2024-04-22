local keymap = vim.keymap

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Buffer Management
keymap.set("n", "<leader>q", ":bdelete<CR>", { silent = true })
keymap.set("n", "<leader><Right>", ":bnext<CR>", { silent = true })
keymap.set("n", "<leader><Left>", ":bprevious<CR>", { silent = true })

-- Window Management
keymap.set("n", "<C-S-Up>", "<C-w>+", { silent = true })
keymap.set("n", "<C-S-Down>", "<C-w>-", { silent = true })
keymap.set("n", "<C-S-Right>", "<C-w>>", { silent = true })
keymap.set("n", "<C-S-Left>", "<C-w><", { silent = true })
keymap.set("n", "<leader>wh", ":split<CR>", { silent = true })
keymap.set("n", "<leader>wv", ":vsplit<CR>", { silent = true })
keymap.set("n", "<leader>wq", ":close<CR>", { silent = true })

-- Navigation
keymap.set("n", "<C-Up>", "<C-w>k", { noremap = true })
keymap.set("n", "<C-Down>", "<C-w>j", { noremap = true })
keymap.set("n", "<C-Left>", "<C-w>h", { noremap = true })
keymap.set("n", "<C-Right>", "<c-w>l", { noremap = true })

-- Indenting
keymap.set("v", "<", "<gv", { noremap = true })
keymap.set("v", ">", ">gv", { noremap = true })

-- Redo
keymap.set("n", "<C-r>", "<nop>", { silent = true })
keymap.set("n", "r", ":redo<CR>", { silent = true })
