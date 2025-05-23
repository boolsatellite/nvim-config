return {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "VeryLazy",
    config = function (_ , opts)
        local get_option = vim.filetype.get_option
        vim.filetype.get_option = function(filetype, option)
            return option == "commentstring"
            and require("ts_context_commentstring.internal").calculate_commentstring()
            or get_option(filetype, option)
        end
    require('ts_context_commentstring').setup {
        enable_autocmd = false,
    }
    end
}