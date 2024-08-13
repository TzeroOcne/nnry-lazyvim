-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- function leave_snippet()
--   if
--     ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
--     and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
--     and not require('luasnip').session.jump_active
--   then
--     require('luasnip').unlink_current()
--   end
-- end
--
-- -- stop snippets when you leave to normal mode
-- vim.api.nvim_command([[
--   autocmd ModeChanged * lua leave_snippet()
-- ]])

vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { "*" },
  callback = vim.snippet.stop,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup("AutoFileType"),
  pattern = { "*.templ" },
  callback = function ()
    vim.bo.filetype = "templ"
    vim.cmd(":LspSaga htmx")
  end
})

vim.api.nvim_set_hl(0, 'TreesitterContext', {  })
