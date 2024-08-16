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
};
