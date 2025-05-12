-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "s", "<nop>")

vim.keymap.set("n", "<leader><cr>", ":nohlsearch<cr>", opts)

--  分屏导航
vim.keymap.set("n", "<C-h>", "<Cmd>wincmd h<CR>", opts)
vim.keymap.set("n", "<C-j>", "<Cmd>wincmd j<CR>", opts)
vim.keymap.set("n", "<C-k>", "<Cmd>wincmd k<CR>", opts)
vim.keymap.set("n", "<C-l>", "<Cmd>wincmd l<CR>", opts)

-- split screen
vim.keymap.set("n", "sk", ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>", opts)
vim.keymap.set("n", "sj", ":set splitbelow<CR>:split<CR>", opts)
vim.keymap.set("n", "sh", ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>", opts)
vim.keymap.set("n", "sl", ":set splitright<CR>:vsplit<CR>", opts)

-- terminal 模式下 esc 支持
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { silent = true, desc = "Terminal: Exit to Normal mode" })
-- 滚动半屏后光标所在行会居中显示
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })

vim.keymap.set("n", "K", "5k", opts)
vim.keymap.set("n", "J", "5j", opts)

vim.keymap.set("v", "K", "5k", opts)
vim.keymap.set("v", "J", "5j", opts)

-- adjust window size
vim.keymap.set("n", "<up>", ":res +5<cr>", opts)
vim.keymap.set("n", "<down>", ":res -5<cr>", opts)
vim.keymap.set("n", "<left>", ":vertical resize+5<cr>", opts)
vim.keymap.set("n", "<right>", ":vertical resize-5<cr>", opts)

-- tab management
vim.keymap.set("n", "ti", ":tabe<cr>", opts)        -- 创造tab
vim.keymap.set("n", "th", ":-tabnext<cr>", opts)    -- 上一个tab
vim.keymap.set("n", "tl", ":+tabnext<cr>", opts)    -- 下一个tab
vim.keymap.set("n", "td", ":tabclose<CR>", opts)    -- 删除当前tab


vim.cmd([[
nnoremap <F5> :call CompileRunGcc()<CR>

func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    set splitbelow
    exec "!g++ % -o %<"
    sp | resize 12
    term ./%<
  elseif &filetype == 'cpp'
    set splitbelow
    exec "!g++ -std=c++17 % -Wall -o %<"
    sp | resize 12
    term ./%<
  elseif &filetype == 'java'
    set splitbelow
    sp | resize 10
    term javac % && time java %<
  elseif &filetype == 'rust'
    set splitbelow
    sp | resize 10
    term cargo run
  elseif &filetype == 'sh'
    set splitbelow
    sp | resize 10
    term bash %
  elseif &filetype == 'python'
    set splitbelow
    sp | resize 12
    term python3 %
  elseif &filetype == 'html'
    silent! exec "!".g:mkdp_browser." % &"
  elseif &filetype == 'markdown'
    exec ":MarkdownPreview"
  elseif &filetype == 'javascript'
    set splitbelow
    sp | resize 12
    term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
  elseif &filetype == 'go'
    set splitbelow
    sp | resize 12
    term go run .
  endif
endfunc
]])


-- todo: 与快速列表有关
-- vim.keymap.set("n", "zo", ":lopen<cr>", opts)
-- vim.keymap.set("n", "zm", ":lnext<cr>", opts)
-- vim.keymap.set("n", "zk", ":lprevious<cr>", opts)
-- vim.keymap.set("n", "zc", ":lclose<cr>", opts)