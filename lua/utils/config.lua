local M = {}

local separator = package.config:sub(1,1)
local nvimpath = vim.fn.join({
  vim.fn.getcwd(),
  '.nvim',
}, separator)

---@param filename string
function M.try_load(filename)
  if vim.fn.isdirectory(nvimpath) then
    local filepath = vim.fn.join({
      nvimpath,
      filename,
    }, separator)
    if vim.fn.findfile('lspconfig.lua', nvimpath) ~= "" then
      local local_lsp_config = dofile(filepath)
      lsp_options = vim.tbl_deep_extend('force', lsp_options, local_lsp_config.opts or {})
    end
  end
end

return M
