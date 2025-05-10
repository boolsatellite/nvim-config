return {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
    config = function (_ , opts) 
        require("trouble").setup({
            action_keys = {
              jump = { "<CR>" },
              jump_close = {},  -- 删除 jump_close，防止 `<CR>` 关闭 Trouble 窗口
            },
            auto_close = false,
          })
        
    end
}

-- | 快捷键          | 功能（Trouble 版）             |
-- | ------------ | ------------------------- |
-- | `<leader>xx` | 打开/关闭所有诊断列表（全局）           |
-- | `<leader>xX` | 打开/关闭当前 buffer 的诊断列表      |
-- | `<leader>cs` | 打开/关闭当前文件的符号（类似 outline）  |
-- | `<leader>cl` | 打开/关闭 LSP 跳转信息（定义/引用等）    |
-- | `<leader>xL` | 打开/关闭 location list（局部错误） |
-- | `<leader>xQ` | 打开/关闭 quickfix list（全局错误） |
