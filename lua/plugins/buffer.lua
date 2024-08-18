return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        -- 使用图标
        show_buffer_icons = true,
        -- 使用nvim-web-devicons插件显示图标
        show_buffer_close_icons = true,
        show_close_icon = false,
        -- 样式设置
        separator_style = "slant",  -- 可以选择 "slant", "thick", "thin", "padded_slant" 等
        -- 左右符号
        left_trunc_marker = '',
        right_trunc_marker = '',
        -- 最大显示文件名长度
        max_name_length = 18,
        -- 最大显示前缀长度
        max_prefix_length = 15,
        -- 在空白buffer右侧显示诊断数
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        -- 鼠标hover时显示诊断
        hover = {
          enabled = true,
          delay = 200,
          reveal = {'close'}
        },
        -- 自定义buffer名称格式化
        name_formatter = function(buf)
          if buf.name:match('%.md') then
            return vim.fn.fnamemodify(buf.name, ':t') .. ' 📝'
          end
        end,
        -- 显示tabs
        show_tab_indicators = true,
        -- 左侧偏移（可以放置如nvim-tree）
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
          }
        },
        -- 修改激活/非激活buffer的高亮
        highlights = {
          fill = {
            guifg = '#FFFFFF',
            guibg = '#1e222a',
          },
          background = {
            guifg = '#5c6370',
            guibg = '#2c323c',
          },
          buffer_selected = {
            guifg = '#FFFFFF',
            guibg = '#3e4451',
            gui = 'bold'
          },
        },
      }
    })
  end,
}
