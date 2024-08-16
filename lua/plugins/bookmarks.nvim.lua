-- with lazy.nvim
return {
  "LintaoAmons/bookmarks.nvim",
  -- tag = "v0.5.4", -- optional, pin the plugin at specific version for stability
  dependencies = {
    {"nvim-telescope/telescope.nvim"},
    {"stevearc/dressing.nvim"} -- optional: to have the same UI shown in the GIF
  },
  keys = function ()
    local adapter = require("bookmarks.adapter")
    local api = require("bookmarks.api")

    return {
      { "<leader>mm", adapter.mark, desc = "Mark", mode = { "n", "v" } },
      { "<leader>mo", adapter.goto_bookmark, desc = "Go to bookmark", mode = { "n", "v" } },
      { "<leader>ma", adapter.mark_commands, desc = "Commands", mode = { "n", "v" } },
      { "<leader>mg", api.goto_last_visited_bookmark, desc = "Go to recent", mode = { "n", "v" } },
    }
  end,
}
