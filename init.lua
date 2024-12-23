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
vim.api.nvim_set_hl(0, 'TreesitterContextLineNumber', { fg='#009090', bold=true })
vim.api.nvim_set_hl(0, 'TreesitterContextBottom', { underline=true, sp='grey' })
vim.api.nvim_set_hl(0, 'TreesitterContextLineNumberBottom', { underline=true, sp='grey' })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg='Cyan' })
vim.api.nvim_set_hl(0, 'DiagnosticUnnecessary', { fg = '#b07f38' })
vim.api.nvim_set_hl(0, 'TreesitterContext', { link='NONE' })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = 'cyan' })
vim.api.nvim_set_hl(0, 'TroubleNormalNC', { link = 'NONE' })

-- NEOTREE
vim.api.nvim_set_hl(0, 'NeoTreeMessage', { fg = '#b07f38' })
vim.api.nvim_set_hl(0, 'NeoTreeFileName', { fg = '#82f3ff' })
