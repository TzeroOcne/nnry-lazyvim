-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

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
