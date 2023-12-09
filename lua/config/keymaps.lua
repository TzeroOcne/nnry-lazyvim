-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local ls = require("luasnip")

local function expand_snippet()
  return ls.expand()
end

map("n", "<C-\\>", "<cmd>Neotree<cr>", { desc = "Jump To Neotree" })
map("n", "<C-w>Q", "<cmd>bd<cr>", { desc = "Close Buffer" })
map("i", "<C-Space>", expand_snippet, { silent = true })