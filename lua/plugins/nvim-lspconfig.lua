return {
  'neovim/nvim-lspconfig',
  dependencies = { 'saghen/blink.cmp', "williamboman/mason.nvim" },

  -- example calling setup directly for each LSP
  config = function()
    vim.diagnostic.config({
      underline = false,
      signs = false,
      update_in_insert = false,
      virtual_text = { spacing = 2, prefix = "●" },
      severity_sort = true,
      float = {
        border = "rounded",
      },
    })
    severity_sort = true  -- 严重性排序

    local capabilities = require('blink.cmp').get_lsp_capabilities()
    local lspconfig = require('lspconfig')

    local function switch_source_header(bufnr)
      local method_name = 'textDocument/switchSourceHeader'
      local client = vim.lsp.get_clients({ bufnr = bufnr, name = 'clangd' })[1]
      if not client then
        return vim.notify(('method %s is not supported by any servers active on the current buffer'):format(method_name))
      end
      local params = vim.lsp.util.make_text_document_params(bufnr)
      client.request(method_name, params, function(err, result)
        if err then
          error(tostring(err))
        end
        if not result then
          vim.notify('corresponding file cannot be determined')
          return
        end
        vim.cmd.edit(vim.uri_to_fname(result))
      end, bufnr)
    end

    local function symbol_info(bufnr)
      local client = vim.lsp.get_clients({ bufnr = bufnr, name = 'clangd' })[1]
      if not client or not client.supports_method('textDocument/symbolInfo') then
        return vim.notify('Clangd client not found', vim.log.levels.ERROR)
      end
      local win = vim.api.nvim_get_current_win()
      local params = vim.lsp.util.make_position_params(win, client.offset_encoding)
      client.request('textDocument/symbolInfo', params, function(err, res)
        if err or not res or #res == 0 then return end
        local container = string.format('container: %s', res[1].containerName)
        local name = string.format('name: %s', res[1].name)
        vim.lsp.util.open_floating_preview({ name, container }, '', {
          height = 2,
          width = math.max(#name, #container),
          focusable = false,
          border = 'single',
          title = 'Symbol Info',
        })
      end, bufnr)
    end

    ------------------------------------------------------------------------
    -- 🔗 clangd 的 on_attach：添加命令与快捷键
    ------------------------------------------------------------------------
    local function clangd_on_attach(client, bufnr)
        if client.server_capabilities.inlayHintProvider then
          -- 启用当前 buffer 的 Inlay Hints
          vim.lsp.inlay_hint.enable(true, { buf = bufnr })
        end
      -- 命令注册
      vim.api.nvim_buf_create_user_command(bufnr, 'LspClangdSwitchSourceHeader', function()
        switch_source_header(bufnr)
      end, { desc = 'Switch between source/header' })

      vim.api.nvim_buf_create_user_command(bufnr, 'LspClangdShowSymbolInfo', function()
        symbol_info(bufnr)
      end, { desc = 'Show symbol info' })

      -- <leader>ch 在 .cpp 和 .h 之间切换（clangd）
      vim.keymap.set("n", "<leader>ch", "<cmd>LspClangdSwitchSourceHeader<CR>", {
        buffer = bufnr,
        desc = "[clangd] Switch source/header"
      })
      -- 	<leader>ci 显示符号信息（symbolInfo 浮窗）
      vim.keymap.set("n", "<leader>ci", "<cmd>LspClangdShowSymbolInfo<CR>", {
        buffer = bufnr,
        desc = "[clangd] Symbol info"
      })
    end

    ------------------------------------------------------------------------
    -- 🔗 rust 的 on_attach：添加命令与快捷键
    ------------------------------------------------------------------------
    local function reload_workspace(bufnr)
      local clients = vim.lsp.get_clients { bufnr = bufnr, name = 'rust_analyzer' }
      for _, client in ipairs(clients) do
        vim.notify 'Reloading Cargo Workspace'
        client.request('rust-analyzer/reloadWorkspace', nil, function(err)
          if err then
            error(tostring(err))
          end
          vim.notify 'Cargo workspace reloaded'
        end, 0)
      end
    end

    local function rust_analyzer_on_attach(client, bufnr)
      if client.server_capabilities.inlayHintProvider then
        -- 第一个参数 true 表示开启
        -- 第二个参数表明作用到当前 buffer
        vim.lsp.inlay_hint.enable(true, { buf = bufnr })
      end
      vim.api.nvim_buf_create_user_command(0, 'LspCargoReload', function()
        reload_workspace(bufnr)
      end, { desc = 'Reload current cargo workspace' })
    end



    lspconfig['lua_ls'].setup({ 
      capabilities = capabilities,
        filetypes = { 'lua' },
        root_markers = {
          '.luarc.json',
          '.luarc.jsonc',
          '.luacheckrc',
          '.stylua.toml',
          'stylua.toml',
          'selene.toml',
          'selene.yml',
          '.git',
        },
    })

    capabilities.textDocument.completion.completionItem.snippetSupport = false
    
    lspconfig['clangd'].setup({
      init_options = {
        InlayHints = {
          Enabled = true,
          ParameterNames = false,
          DeducedTypes = true,
          VariableTypes = true,
          FunctionReturnTypes = true,
        },
      },

      capabilities = capabilities,
      on_attach = clangd_on_attach,
    })

    lspconfig['rust_analyzer'].setup({
      capabilities = capabilities,

      settings = {
        ["rust-analyzer"] = {
          inlayHints = {
            -- 启用所有行内提示功能
            bindingModeHints       = { enable = true },       -- 绑定模式提示                   :contentReference[oaicite:3]{index=3}  
            chainingHints          = { enable = true },       -- 链式调用中间结果提示             :contentReference[oaicite:4]{index=4}  
            closingBraceHints      = { enable = true },       -- 在闭合大括号后显示提示           :contentReference[oaicite:5]{index=5}  
            closureReturnTypeHints = { enable = "never" },    -- 闭包返回类型提示，可设 "always"/"never"/"if_multiple" :contentReference[oaicite:6]{index=6}  
            lifetimeElisionHints   = { enable = true },       -- 生命周期省略提示                 :contentReference[oaicite:7]{index=7}  
            -- parameterNames         = { enable = "all" },      -- 函数调用参数名提示                :contentReference[oaicite:8]{index=8}  
            variableTypes          = { enable = true },       -- 局部变量类型提示                  :contentReference[oaicite:9]{index=9}  
            functionReturnTypes    = { enable = true },       -- 函数返回类型提示                  :contentReference[oaicite:10]{index=10}  
          },
        },
      },
      on_attach = rust_analyzer_on_attach,
    })



    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- 	显示当前光标符号的文档说明
        vim.keymap.set("n", "K", vim.lsp.buf.hover)

        -- 显示诊断（错误/警告）浮窗
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {
          buffer = ev.buf,
          desc = "[LSP] Show diagnostic",
        })

        -- 显示函数签名
        vim.keymap.set("n", "<leader>gk", vim.lsp.buf.signature_help, { desc = "[LSP] Signature help" })
        
        -- 添加工作区文件夹
        vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "[LSP] Add workspace folder" })
        
        -- 移除工作区文件夹
        vim.keymap.set(
          "n",
          "<leader>wr",
          vim.lsp.buf.remove_workspace_folder,
          { desc = "[LSP] Remove workspace folder" }
        )
        -- 显示工作区列表
        vim.keymap.set("n", "<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, { desc = "[LSP] List workspace folders" })

        -- 重命名当前变量或函数
        vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { buffer = ev.buf, desc = "[LSP] Rename" })

        -- 跳转到定义
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "[LSP] Go to definition" })

        -- 跳转到声明（一般是头文件声明或接口定义）
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "[LSP] Go to declaration" })

        -- 跳转到实现（适用于接口/抽象类等）
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = ev.buf, desc = "[LSP] Go to implementation" })

        -- 显示引用列表（谁用到了这个变量/函数）
        -- vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = ev.buf, desc = "[LSP] Show references" })
        vim.keymap.set("n", "gr", "<cmd>Trouble lsp_references<cr>", { buffer = ev.buf, desc = "[LSP] Show references (Trouble)" })


        -- 显示代码动作（如自动修复、导入等）
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "[LSP] Code action" })

      end,
    })

  end
}