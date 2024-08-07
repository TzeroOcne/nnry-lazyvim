return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts_extend = { "spec" },
  opts = {
    defaults = {},
    spec = {
      {
        mode = { "n", "v" },
        { "<leader>t", group = "term" },
        { "<leader>m", desc = "Mini Map" },
      },
    },
  },
}
