return {
  "folke/noice.nvim",
  opts = {
    lsp = {
      signature = {
        auto_open = {
          enabled = false,
          trigger = false, -- Automatically show signature help when typing a trigger character from the LSP
          luasnip = false, -- Will open signature help when jumping to Luasnip insert nodes
        },
      },
    },
  },
}
