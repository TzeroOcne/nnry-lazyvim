-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local unmap = vim.keymap.del

map("n", "<C-\\>", "<cmd>Neotree<cr>")
map("n", "<C-w>e", "<cmd>bd<cr>", { desc = "Close Buffer" })
map("n", "<Bslash>O", "O<Esc><Down>", { desc = "New Line Above" })

unmap({ "n", "v" }, "s")
