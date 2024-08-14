-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local unmap = vim.keymap.del

local outline = require('outline')
local LazyVim = require('lazyvim.util')

unmap("n", "<C-_>")

map("n", "<C-\\>", "<cmd>Neotree<cr>")
map("n", "<C-n>", "<cmd>nohl<cr>")
map("n", "<Bslash>O", "O<Esc><Down>", { desc = "New Line Above" })
map("n", "<Bslash>o", "o<Esc><Up>", { desc = "New Line Below" })

map("n", "<C-_>", function() LazyVim.terminal("zsh") end, { desc = "Open zsh term" })
map("n", "<leader>tz", function() LazyVim.terminal("zsh") end, { desc = "Open zsh term" })
map("n", "<leader>tp", function() LazyVim.terminal("pwsh") end, { desc = "Open powershell term" })

local function is_file_buffer(buf)
  return vim.api.nvim_buf_is_loaded(buf) and
         vim.api.nvim_buf_get_name(buf) ~= "" and
         vim.api.nvim_get_option_value('buftype', { buf = buf }) == ""
end

local function close_all_file_buffers()
  outline.close()
  local buffers = vim.api.nvim_list_bufs()
  for _, buf in ipairs(buffers) do
    if is_file_buffer(buf) then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end

-- Optional: Create a key mapping to run this function
map('n', '<leader>bx', close_all_file_buffers, { noremap = true, silent = true, desc = "Close all file buffer" })

