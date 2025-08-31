return {
    "cappyzawa/trim.nvim",
    config = function()
        require('trim').setup({
            -- 只清理行尾空格，不处理文件末尾空行
            trim_trailing = true,
            trim_last_line = false,       -- 不删除最后空行
            trim_whitespace_on_save = false, -- 我们用 autocmd 手动触发
        })

        -- 定义代码文件类型列表
        local code_filetypes = {
            "c", "cpp", "cc", "h", "hpp", "py", "java", "lua", "js", "ts", "go", "rs", "cs"
        }

        -- 保存文件前清理尾部空格，只对代码文件生效
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function()
                vim.cmd("Trim")
            end,
        })
    end,
}




