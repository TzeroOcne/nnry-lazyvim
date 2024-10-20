return {
  "nvim-cmp",
  dependencies = {
    { "roobert/tailwindcss-colorizer-cmp.nvim", opts = {} },
  },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local cmp = require("cmp")
    local default = require('cmp.config.default')();
    opts.preselect = cmp.PreselectMode.None;
    opts.completion.completeopt = "menu,menuone,noinsert,noselect";
    opts.sorting = default.sorting;
    local format_kinds = function(_, vim_item)
      vim_item.abbr = string.sub(vim_item.abbr, 1, 30) -- Length limit for completeion name
      vim_item.menu = string.sub(vim_item.menu or '', 1, 20) -- Length limit for completion detail
      return vim_item
    end
    opts.formatting = vim.tbl_extend('force', default.formatting, {
      ---@param entry cmp.Entry
      ---@param vim_item vim.CompletedItem
      format = function(entry, vim_item)
        format_kinds(entry, vim_item)
        return require('tailwindcss-colorizer-cmp').formatter(entry, vim_item)
      end
    })
    opts.view = {
      docs = {
        auto_open = false,
      },
    }

    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
          cmp.select_next_item()
        elseif vim.snippet.active({ direction = 1 }) then
          vim.schedule(function()
            vim.snippet.jump(1)
          end)
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.snippet.active({ direction = -1 }) then
          vim.schedule(function()
            vim.snippet.jump(-1)
          end)
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<M-m>"] = cmp.mapping(function()
        if cmp.visible_docs() then
          cmp.close_docs()
        else
          cmp.open_docs()
        end
      end, { "i" }),
    })
  end,
}
