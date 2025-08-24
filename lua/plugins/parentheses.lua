return {
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {
            enable_check_bracket_line = false,
            ignored_next_char = "[%w%.]" -- will ignore alphanumeric and `.` symbol
        },
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        submodules = false,
        main = "rainbow-delimiters.setup",
        opts = {}
    }
}