return {
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    version = "*",
    keys = {
      -- 普通模式下：<C-t> 切换 / 打开 (默认第 1 个；前置数字可改目标)
      { "<C-t>", "<Cmd>exe v:count1 . 'ToggleTerm'<CR>", mode = "n", desc = "Toggle terminal" },
      -- 插入模式下：先退出 Insert 再切换
      -- { "<C-t>", "<Esc><Cmd>exe v:count1 . 'ToggleTerm'<CR>", mode = "i", desc = "Toggle terminal" },
      -- 终端模式下：保持在终端里也能切换
      { "<C-t>", "<Cmd>exe v:count1 . 'ToggleTerm'<CR>", mode = "t", desc = "Toggle terminal" },
    },
    config = function()
      require("toggleterm").setup({
        size = function(term)
          if term.direction == "float" then
            return 20
          elseif term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          else
            return 20
          end
        end,
        open_mapping = "<C-t>",
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        persist_mode = true,
        direction = "horizontal", --   close_on_exit = true,"vertical" | "horizontal" | "tab" | "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved", -- 'single' | 'double' | 'shadow' | 'curved' |
          winblend = 3,
        },
      })
    end,
  },
}