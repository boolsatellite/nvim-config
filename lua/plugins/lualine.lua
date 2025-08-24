return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            theme = "catppuccin",
            always_divide_middle = false,
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
        }
    }
}