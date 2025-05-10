return {
    "folke/ts-comments.nvim",
    event = "VeryLazy",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,

    config = function ()
      require('Comment').setup {
        hook = function(_, opts)
        require('ts_context_commentstring').update_commentstring()
        end,
      }
    end
  }