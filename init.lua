-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Restore cursor to bar blink when exit
vim.cmd([[
augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver30-iCursor-blinkwait300-blinkon200-blinkoff150
augroup END
]])

-- Make some background transparent
vim.cmd([[
  hi CursorLine guibg=NONE
  hi NeoTreeNormal guibg=NONE
  hi NeoTreeNormalNC guibg=NONE
  hi TroubleNormal guibg=NONE
]])

vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#009090', bold=true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#009090', bold=true })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg='Cyan' })
