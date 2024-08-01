-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local unmap = vim.keymap.del
local LazyVim = require('lazyvim.util')

unmap("n", "<C-_>")

map("n", "<C-\\>", "<cmd>Neotree<cr>")
map("n", "<C-w>e", "<cmd>bp|bd#<cr>", { desc = "Close Buffer" })
map("n", "<Bslash>O", "O<Esc><Down>", { desc = "New Line Above" })

map("n", "<C-_>", function() LazyVim.terminal("zsh") end, { desc = "Open zsh term" })
map("n", "<leader>tz", function() LazyVim.terminal("zsh") end, { desc = "Open zsh term" })
map("n", "<leader>tp", function() LazyVim.terminal("pwsh") end, { desc = "Open powershell term" })
