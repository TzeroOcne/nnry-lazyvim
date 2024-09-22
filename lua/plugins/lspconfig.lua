local lsp_options = {
  inlay_hints = { enabled = false },
  servers = {
    gdscript = {},
    cssls = {
      settings = {
        css = {
          lint = {
            unknownAtRules = "ignore",
          },
        },
      },
    },
    tailwindcss = {
      settings = {
        tailwindCSS = {
          classAttributes = {
            "class",
            "className",
            "ngClass",
            "class:list",
            "contentClass",
          },
        },
      },
    },
  },
}

local separator = package.config:sub(1,1)
local nvimpath = vim.fn.join({
  vim.fn.getcwd(),
  '.nvim',
}, separator)
local local_lsp_path = vim.fn.join({
  nvimpath,
  'lspconfig.lua',
}, separator)
if vim.fn.isdirectory(nvimpath) then
  if vim.fn.findfile('lspconfig.lua', nvimpath) ~= "" then
    local local_lsp_config = dofile(local_lsp_path)
    lsp_options = vim.tbl_deep_extend('force', lsp_options, local_lsp_config.opts or {})
  end
end

return {
  "neovim/nvim-lspconfig",
  opts = lsp_options,
  setup = {
    tailwindcss = function(_, opts)
      local tw = require("lspconfig.server_configurations.tailwindcss")
      opts.filetypes = opts.filetypes or {}

      -- Add default filetypes
      vim.list_extend(opts.filetypes, tw.default_config.filetypes)

      -- Remove excluded filetypes
      --- @param ft string
      opts.filetypes = vim.tbl_filter(function(ft)
        return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
      end, opts.filetypes)

      -- Additional settings for Phoenix projects
      local settings = {
        tailwindCSS = {
          includeLanguages = {
            elixir = "html-eex",
            eelixir = "html-eex",
            heex = "html-eex",
          },
        },
      }
      opts.settings = vim.tbl_deep_extend('force', settings, opts.settings or {})

      -- Add additional filetypes
      vim.list_extend(opts.filetypes, opts.filetypes_include or {})
    end,
  },
};
