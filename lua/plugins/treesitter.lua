return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy   = false,
    build  = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
	  auto_install = true,
        ensure_installed = {
          "cpp", "c", "rust", "python", "lua",
          "markdown", "toml", "json", "csv",
          "bash", "sql",
        },
        sync_install = true,
        highlight = {
          enable = true,
          disable = function(lang, buf)
            local max_bytes = 100 * 1024
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            return ok and stats and stats.size > max_bytes
          end,
          additional_vim_regex_highlighting = false,
        },
        -- 如果想开启增量选择，可取消下面注释
        -- incremental_selection = {
        --   enable = true,
        --   keymaps = {
        --     init_selection    = "gnn",
        --     node_incremental  = "grn",
        --     scope_incremental = "grc",
        --     node_decremental  = "grm",
        --   },
        -- },
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event        = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      textobjects = {
        select = {
          enable    = true,
          lookahead = true,
          keymaps   = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["ai"] = "@conditional.outer",
            ["ii"] = "@conditional.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
          },
        },
        move = {
          enable    = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
          },
        },
        swap = {
          enable = false,  -- 如需使用参数交换请改为 true
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
