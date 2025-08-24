return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()





        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

        vim.keymap.set('n', '<leader>lr', builtin.lsp_references, { desc = "LSP: Find References" })
        vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = "LSP: Find References" })
        
        -- vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, { desc = "LSP: Document Symbols" })
        -- vim.keymap.set('n', '<leader>lS', builtin.lsp_workspace_symbols, { desc = "LSP: Workspace Symbols" })
        vim.keymap.set('n', '<leader>lW', builtin.lsp_dynamic_workspace_symbols,
            { desc = "LSP: Dynamic Workspace Symbols" })
        vim.keymap.set('n', '<leader>ld', function() builtin.diagnostics({ bufnr = 0 }) end,
            { desc = "LSP: Diagnostics (current buffer)" })
        vim.keymap.set('n', '<leader>lI', builtin.lsp_implementations, { desc = "LSP: Implementations" })
        vim.keymap.set('n', '<leader>ldf', builtin.lsp_definitions, { desc = "LSP: Definitions" })
        vim.keymap.set('n', '<leader>ltd', builtin.lsp_type_definitions, { desc = "LSP: Type Definitions" })
        vim.keymap.set("n", "<leader>cq", builtin.quickfix, { desc = "Quickfix Errors" })
        vim.keymap.set("n", "<leader>fr", builtin.registers	, { desc = "Telescope find registers" })
  

    end
}
