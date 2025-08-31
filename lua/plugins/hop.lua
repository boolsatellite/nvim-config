return {
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
        require'hop'.setup()

        local map = vim.keymap.set
        -- normal 模式 f/F 功能增强
        map('n', 's', "<cmd>HopChar2AC<cr>", { noremap = true, silent = true, desc = "Hop to 2 chars" })

    end
}

