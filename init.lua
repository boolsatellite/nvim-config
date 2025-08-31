vim.g.mapleader = " "
-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'
-- jkhl 移动时光标周围保留8行
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- 空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true
-- 新行对齐当前行
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true
-- 搜索高亮
vim.o.hlsearch = true
-- 边输入边搜索
vim.o.incsearch = true
-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true
-- 禁止折行
vim.wo.wrap = false
-- 鼠标支持
vim.o.mouse = "a"
-- 永远显示 tabline
vim.o.showtabline = 2
-- 启用真彩色
vim.opt.termguicolors = true
vim.opt.termguicolors = true
vim.opt.mousemoveevent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.wrap = false
-- 使用系统剪贴板
vim.opt.clipboard = "unnamedplus"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set("n", "s", "<Nop>")
vim.keymap.set("n", "S", "<Nop>")
vim.keymap.set("n", "W", "<Nop>")
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap=true, silent=true, desc = "Move to left window" })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap=true, silent=true, desc = "Move to below window" })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap=true, silent=true, desc = "Move to above window" })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap=true, silent=true, desc = "Move to right window" })
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>', {noremap=true, silent=true, desc = "vertical split window"})  -- 垂直分割窗口
vim.keymap.set('n', '<leader>sh', ':split<CR>', {noremap=true, silent=true, desc = "split horizon window"})  -- 水平分割窗口
vim.keymap.set('n', '<leader>w', ':w<CR>', {noremap=true, silent=true, desc = "save file"})        -- 保存文件
vim.keymap.set('n', '<leader>q', ':q<CR>', {noremap=true, silent=true, desc = "quit file"})        -- 退出␍

vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })  -- 在 terminal 模式下，用 Esc 快速切换

-- 调整窗口大小
vim.keymap.set('n', '<C-Up>',    '<cmd>resize +2<CR>', { desc = "Increase height" })
vim.keymap.set('n', '<C-Down>',  '<cmd>resize -2<CR>', { desc = "Decrease height" })
vim.keymap.set('n', '<C-Left>',  '<cmd>vertical resize -2<CR>', { desc = "Decrease width" })
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize +2<CR>', { desc = "Increase width" })



require("config.lazy")

