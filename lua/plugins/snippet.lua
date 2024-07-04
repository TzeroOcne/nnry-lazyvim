return {
  "nvim-cmp",
  dependencies = {
    {
      "garymjr/nvim-snippets",
      opts = {
        friendly_snippets = true,
        search_paths = {
          vim.fn.stdpath('config') .. '/snippets',
          vim.fn.stdpath('config') .. '/.local/snippets',
        }
      },
      dependencies = { "rafamadriz/friendly-snippets" },
    },
  },
  opts = function(_, opts)
    opts.snippet = {
      expand = function(item)
        return LazyVim.cmp.expand(item.body)
      end,
    }
    if LazyVim.has("nvim-snippets") then
      table.insert(opts.sources, { name = "snippets" })
    end
  end,
}
