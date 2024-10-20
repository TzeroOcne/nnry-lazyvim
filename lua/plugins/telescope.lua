return {
  "nvim-telescope/telescope.nvim",
  opts = function (_, opts)
    opts.defaults = vim.tbl_deep_extend(
      'force',
      opts.defaults or {},
      {
        path_display = {
          "filename_first",
        },
      }
    )
  end
}
