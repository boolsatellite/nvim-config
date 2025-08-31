return {
    'akinsho/bufferline.nvim',
    lazy = false,
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    keys = {
        { "L", "<Cmd>BufferLineCycleNext<CR>", mode = "n", desc = "next buffer" },
        { "H", "<Cmd>BufferLineCyclePrev<CR>", mode = "n", desc = "pre buffer" },
        { "<leader>bp", "<Cmd>BufferLineMovePrev<CR>", desc = "move left Buffer" },
        { "<leader>bn", "<Cmd>BufferLineMoveNext<CR>", desc = "move right Buffer" },
        { "<leader>bd", "<Cmd>bdelete<CR>", desc = "delete buffer" },
        { "<leader>bs", "<Cmd>BufferLineSortByName<CR>", desc = "sort buffer by name" },

        { "<A-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", desc = "goto 1st buffer" },
        { "<A-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", desc = "goto 2nd buffer" },
        { "<A-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", desc = "goty 3rd buffer" },
        { "<A-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", desc = "goty 4th buffer" },
        { "<A-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", desc = "goty 5th buffer" },
        { "<A-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", desc = "goty 6th buffer" },
        { "<A-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", desc = "goty 7th buffer" },
        { "<A-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", desc = "goty 8th buffer" },
        { "<A-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", desc = "goty 9th buffer" },
    },
    opts = {
        options = {
            mode = "buffers",
            diagnostics = "nvim_lsp",
            separator_style = "slant",
        },
    },
    config = function (_, opts)
        require("bufferline").setup(opts)

        local bufferline = require("bufferline")
        vim.api.nvim_create_user_command("BufferLineSortByName", function()
            bufferline.setup({
                options = {
                    sort_by = function(a, b)
                        return a.name:lower() < b.name:lower()
                    end,
                },
            })
            vim.cmd("redrawtabline") -- 刷新 bufferline 视图
        end, {})

        vim.api.nvim_set_hl(0, "BufferLineBufferSelected", {
            underline = true,
            sp = "cyan",
        })

    end
}
