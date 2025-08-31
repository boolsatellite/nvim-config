return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- {"rcarriga/nvim-notify", opts = {background_colour = "#000000"}}
    },
    keys = {
      {"<leader>nc", "<cmd>Noice dismiss<CR>", { desc = "Noice: Clear all messages" }},
      {"<leader>N", "<cmd>Telescope noice<CR>", { desc = "Noice: Show all history via Telescope" }},
      { "<leader>NH", "<cmd>Noice<CR>", desc = "[Noice] Show all messages" },  -- 原生 Noice

    },

    opts = {
      popupmenu = {
        enabled = false,
      },
      cmdline = {
          enabled = true,
          view = "cmdline_popup", -- 或者 "cmdline" / "popup"
          format = {
              search_down = { view = "cmdline_popup" }, -- 用原生显示 `/`
              search_up = { view = "cmdline_popup" },   -- 用原生显示 `?`
          },
      },
      notify = {
        enabled = true,
      },
      lsp = {

        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
          ["vim.lsp.util.stylize_markdown"] = false,
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
      routes = {
        -- Hide search count
        -- { filter = { event = "msg_show", kind = "search_count" }, opts = { skip = true } },
        -- Hide written message
        -- { filter = { event = "msg_show", kind = "" }, opts = { skip = true } },
      },
    },
}
