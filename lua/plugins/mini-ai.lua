return {
    "echasnovski/mini.ai",
    event = "VeryLazy",


    ai_buffer = function (ai_type)
      local start_line, end_line = 1, vim.fn.line("$")
      if ai_type == "i" then
        -- Skip first and last blank lines for `i` textobject
        local first_nonblank, last_nonblank = vim.fn.nextnonblank(start_line), vim.fn.prevnonblank(end_line)
        -- Do nothing for buffer with all blanks
        if first_nonblank == 0 or last_nonblank == 0 then
          return { from = { line = start_line, col = 1 } }
        end
        start_line, end_line = first_nonblank, last_nonblank
      end

      local to_col = math.max(vim.fn.getline(end_line):len(), 1)
      return { from = { line = start_line, col = 1 }, to = { line = end_line, col = to_col } }
    end,


    opts = function()
      local ai = require("mini.ai")
      return {
        n_lines = 500,
        custom_textobjects = {
          o = ai.gen_spec.treesitter({ -- code block
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }),
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
          c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
          t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
          d = { "%f[%d]%d+" }, -- digits
          e = { -- Word with case
            { "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
            "^().*()$",
          },
          g = ai_buffer, -- 整个文件
          u = ai.gen_spec.function_call(), -- 选中带小括号的函数调用
          U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- aU 仅匹配简单函数名
        },
      }
    end,

    config = function(_, opts)
      require("mini.ai").setup(opts)
    end,
  }
    -- ao 选择整个 if/for/while 块；
    -- io 选择内部内容。
    -- af 选择整个函数；
    -- if 选择函数内部内容。
    -- ac 选择整个类（如 Python 的 class 或 Java 的类）；
    -- ic 选类中内容。
    -- at 匹配整个 HTML/XML 标签；
    -- it 匹配标签内的内容。
    -- ad/id 匹配数字。
    -- ae/ie 支持 camelCase, snake_case, ALLCAPS 等混合样式单词。
    -- ag/ig 匹配整个 buffer（整份文件）；
    -- au/iu 选择整个函数调用（如 foo(arg1, arg2)）；
    -- aU 仅匹配简单函数名（不含 .）。