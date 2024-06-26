local map = vim.keymap.set
local current_dir = vim.fn.getcwd()
print("Current Directory:", current_dir)

local localAppData = os.getenv('LOCALAPPDATA')
vim.cmd('cd ' .. localAppData .. '/nvim')
-- Get the current working directory
current_dir = vim.fn.getcwd()

-- Print the current directory
print("Current Directory:", current_dir)

require("lua.config.vscode")
