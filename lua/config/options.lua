vim.opt.termguicolors = true
vim.opt.hidden = true

vim.g.loaded_netrw = 1          -- 禁用 netrw.vim
vim.g.loaded_netrwPlugin = 1    -- 禁用 netrwPlugin.vim


vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftround = true
vim.opt.cursorline = true   -- 高亮当前光标所在的那一行。
vim.opt.termguicolors = true    --启用 24-bit “真彩色”支持
vim.opt.ignorecase = true       -- 忽略大小写：搜索时不区分大小写。
vim.opt.hlsearch = true         -- 高亮所有匹配项：在搜索之后，高亮所有与关键词匹配的文本。
vim.opt.incsearch = true        -- 增量搜索：在输入搜索关键词时就会立即显示匹配项，而不是等你按回车。
vim.opt.autoindent = true       -- 自动缩进
vim.opt.tabstop = 2             -- 视觉效果tabsize = 2
vim.opt.shiftwidth = 2          -- vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2         -- 在插入模式下按下 <Tab> 键时，插入几个空格     
vim.opt.expandtab = true        -- 将 tab 键转换为空格
vim.opt.smartindent = true      -- 启用更智能的缩进行为，例如在新行开头自动缩进到正确位置。
vim.opt.mouse = "a"             -- 支持鼠标
vim.opt.encoding = "utf-8"      -- 设置默认文件编码为 UTF-8。
vim.opt.autowrite = true        -- 自动保存当前缓冲区内容（在切换缓冲区或执行某些命令前）。
vim.opt.autoread = true         -- 文件在外部被修改时，自动重新读取。
vim.opt.scrolloff = 10
vim.opt.clipboard = "unnamedplus"   -- vim.opt.clipboard = "unnamedplus"
vim.opt.lazyredraw = false          -- 禁用懒惰重绘
vim.opt.shell = os.getenv("SHELL")  -- 设置 shell 为系统环境变量 SHELL 的值

vim.opt.virtualedit = "block"       -- 在视觉块模式中，允许光标到达非实际字符位置（虚拟编辑），如空白右侧。
vim.opt.inccommand = "split"        -- 实时预览 :s/.../.../ 替换命令的效果


vim.opt.undofile = true             -- 启用持久化撤销功能。
vim.opt.undodir = vim.fn.expand("~/.config/nvim/.tmp/undo")     --设置撤销文件的保存目录。

local au = vim.api.nvim_create_autocmd
local ag = vim.api.nvim_create_augroup

-- 当你 yank（复制）文本时，短暂高亮那段文本。
au("TextYankPost", {
  group = ag("yank_highlight", {}),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
  end,
})











