-- local clangd_config = require("plugins.lsp.clangd");
-- print(clangd_config);

return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'saghen/blink.cmp',
        },

        -- example using `opts` for defining servers
        opts = {
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "clangd",
                "pyright"
            },
            servers = {
                lua_ls = {},
                pyright = require("plugins.lsp.pyright"),
                clangd = require("plugins.lsp.clangd"),
                cmake = require("plugins.lsp.cmake"),
                rust_analyzer = require("plugins.lsp.rust_analyzer"),
            },
        },
        config = function(_, opts)
            vim.diagnostic.config({
                underline = false,
                signs = false,
                -- signs = {
                --     text = {
                --         [vim.diagnostic.severity.ERROR] = "✘",
                --         [vim.diagnostic.severity.WARN] = "▲",
                --         [vim.diagnostic.severity.HINT] = "⚑",
                --         [vim.diagnostic.severity.INFO] = "»",
                --     },
                -- },
                update_in_insert = false,
                virtual_text = { spacing = 2, prefix = "●" },
                severity_sort = true,
                float = {
                    border = "rounded",
                },
            })

            local lspconfig = require('lspconfig')
            for server, config in pairs(opts.servers) do
                -- passing config.capabilities to blink.cmp merges with the capabilities in your
                -- `opts[server].capabilities, if you've defined it
                config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
                lspconfig[server].setup(config)
            end

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf })

                    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {
                        buffer = ev.buf,
                        desc = "[LSP] Show diagnostic",
                    })

                    vim.keymap.set("n", "<leader>gk", vim.lsp.buf.signature_help, {
                        buffer = ev.buf,
                        desc = "[LSP] Signature help" 
                    })

                    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { 
                        desc = "[LSP] Add workspace folder"
                    })

                    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, {
                        desc = "[LSP] Remove workspace folder"
                    })

                    vim.keymap.set("n", "<leader>wl", function()
                            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                        end, {
                        desc = "[LSP] List workspace folders" 
                    })

                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
                        buffer = ev.buf, 
                        desc = "[LSP] Rename" 
                    })

                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
                        buffer = ev.buf,
                        desc = "[LSP] Go to definition"
                    })

                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {
                        buffer = ev.buf,
                        desc = "[LSP] Go to declaration"
                    })

                    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {
                        buffer = ev.buf,
                        desc = "[LSP] Go to type definition"
                    })

                    -- vim.keymap.set("n", "gr", vim.lsp.buf.references, {
                    --     buffer = ev.buf,
                    --     desc = "[LSP] List references"
                    -- })

                    vim.keymap.set("n", "<leader>-", vim.diagnostic.goto_prev, {
                        buffer = ev.buf,
                        desc = "[LSP] Previous diagnostic"
                    })

                    vim.keymap.set("n", "<leader>=", vim.diagnostic.goto_next, {
                        buffer = ev.buf,
                        desc = "[LSP] Next diagnostic"
                    })

                    vim.keymap.set('n', '<leader>ch', '<cmd>LspClangdSwitchSourceHeader<CR>', {     -- 头文件和源文件切换
                        buffer = ev.buf,
                        desc = "[clangd] Switch Source/Header"
                    })

                    -- vim.keymap.set("n", "<leader>ca", require("telescope.builtin").lsp_code_actions, {
                    --     buffer = ev.buf,
                    --     desc = "Telescope Code Actions" 
                    -- })
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
                        buffer = ev.buf,
                        desc = "Code Action Menu"
                    })

                end,
            })
        end,

    },
}
