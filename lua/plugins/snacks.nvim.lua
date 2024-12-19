return {
  ---@module 'snacks'
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  --- @type snacks.Config
  opts = {
    notifier = {
      enabled = true,
    },
    styles = {
      terminal = {
        wo = {
          relativenumber = true,
          numberwidth = 5,
        },
      },
      lazygit = {
        wo = {
          relativenumber = false,
        },
      },
    },
  },
}
