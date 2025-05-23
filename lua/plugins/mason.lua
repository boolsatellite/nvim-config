return {
    "mason-org/mason.nvim",
    config = function ()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })

        -- local mr = require("mason-registry")
        -- local function ensure_installed()
        --     for _, tool in ipairs(opts.ensure_installed) do
        --     local p = mr.get_package(tool)
        --     if not p:is_installed() then
        --         p:install()
        --     end
        --     end
        -- end
        -- if mr.refresh then
        --     mr.refresh(ensure_installed)
        -- else
        --     ensure_installed()
        -- end
    end
}