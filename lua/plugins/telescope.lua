return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
        },
    },
    cmd = "Telescope",  -- Lazy load
    keys = {
        { "<leader>ff", function() require('telescope.builtin').find_files() end, desc = "[Telescope] Find files" },
        { "<leader>fg", function() require('telescope.builtin').live_grep() end, desc = "[Telescope] Live grep" },
        { "<leader>fb", function() require('telescope.builtin').buffers() end, desc = "[Telescope] Buffers" },
        { "<leader>fh", function() require('telescope.builtin').help_tags() end, desc = "[Telescope] Help tags" },
        { "<leader>fr", function() require('telescope.builtin').registers() end, desc = "[Telescope] Registers" },
        { "<leader>lr", function() require('telescope.builtin').lsp_references() end, desc = "[Telescope] LSP References" },
        { "gr", function() require('telescope.builtin').lsp_references() end, desc = "[Telescope] LSP References" },
        { "<leader>cq", function() require('telescope.builtin').quickfix() end, desc = "[Telescope] Quickfix" },
        { "<leader>fd", function() require('telescope.builtin').diagnostics({ bufnr = 0 }) end, desc = "[Telescope] Diagnostics (buffer)" },

    },
    config = function ()
        local telescope = require("telescope")

        telescope.setup{
            defaults = {
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                },
                find_command = {
                    "fd", "--type", "f", "--hidden",
                    "--exclude", ".git",
                    "--exclude", "node_modules",
                    "--exclude", "dist",
                    "--exclude", "target",
                },
                mappings = {
                    i = {
                        ["<C-q>"] = require('telescope.actions').close,
                    },
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },
        }

        -- 加载扩展
        pcall(telescope.load_extension, "fzf")
        pcall(telescope.load_extension, "noice")
    end
}
