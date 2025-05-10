return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  keys = {
    -- Buffer pick / Buffer seek
    { "<leader>bs", "<Cmd>BufferLinePick<CR>", desc = "Pick buffer" },

    -- 切换到下一个 / 上一个 buffer
    { "L", "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
    { "H", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev buffer" },

    -- 关闭当前 buffer；<leader>bo 关闭其它所有 buffers
    { "<leader>bd", "<Cmd>bdelete<CR>", desc = "Kill buffer" },
    { "<leader>bo", "<Cmd>BufferLineCloseLeft<CR><Cmd>BufferLineCloseRight<CR>", desc = "Kill other buffers" },
  },

  config = function()
    require("bufferline").setup({
      options = {
        number = "none",
        --number_style = "superscript" | "subscript" | "" | { "none", "subscript" }, -- buffer_id at index 1, ordinal at index 2
        --number_style =  "subscript",
        modified_icon = "✥",
        buffer_close_icon = "󰅖",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 20,
        show_buffer_close_icons = true,
        show_buffer_icons = true,
        show_tab_indicators = true,
        --diagnostics = "coc",
        diagnostics = "nvim_lsp",
        always_show_bufferline = true,
        separator_style = "thin",
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "center",
            padding = 1,
          },
        },
      },
    })
  end,
}
