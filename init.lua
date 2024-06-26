-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.cmd([[
augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver30-iCursor-blinkwait300-blinkon200-blinkoff150
augroup END
]])

vim.cmd([[
  hi CursorLine guibg=NONE
  hi NeoTreeNormal guibg=NONE
  hi NeoTreeNormalNC guibg=NONE
  hi TroubleNormal guibg=NONE
]])
