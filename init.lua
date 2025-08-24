vim.opt.termguicolors = true
vim.opt.mousemoveevent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.wrap = false

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap=true, silent=true, desc = "Move to left window" })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap=true, silent=true, desc = "Move to below window" })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap=true, silent=true, desc = "Move to above window" })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap=true, silent=true, desc = "Move to right window" })

vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })  -- 在 terminal 模式下，用 Esc 快速切换



require("config.lazy")

