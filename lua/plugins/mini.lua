return { 
    'echasnovski/mini.nvim', version = '*',
    config = function ()
        require('mini.files').setup()
    end,

    keys = {
        { "<leader>E", function() require("mini.files").open(vim.api.nvim_buf_get_name(0), true) end, desc = "Explorer current file dir" },
        { "<leader>e", function() require("mini.files").open(vim.uv.cwd(), true) end,                 desc = "Explorer cwd" },
    },
}