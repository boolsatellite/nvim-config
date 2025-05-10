return {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build = ":TSUpdate",

    config = function ()
        config = function () 
            local configs = require("nvim-treesitter.configs")
            vim.api.nvim_set_hl(0, "@foo.bar.cc",  { link = "Identifier" })
            vim.api.nvim_set_hl(0, "@foo.bar.cpp", { link = "Identifier" })
            vim.api.nvim_set_hl(0, "@foo.bar.rust", { link = "Identifier" })

            require("nvim-treesitter").setup({
                ensure_installed = { "c", "cmake", "cpp", "go", "rust", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
                sync_install = false,
                highlight = { enable = true },
                auto_install = true,
                indent = { enable = true },  
            })
        end
    end
}
