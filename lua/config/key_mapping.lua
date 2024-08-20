local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- buffer
keymap('n', '<F2>', ':bprev<CR>', { noremap = true, silent = true })
keymap('n', '<F3>', ':bnext<CR>', { noremap = true, silent = true })

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Visual
keymap("v", "<", "<gv" , opts)          -- < 左移
keymap("v", ">", ">gv" , opts)          -- > 右移
keymap("v", "p", '"_dP', opts)          -- 寄存器相关,不使用默认寄存器