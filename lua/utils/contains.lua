-- contains.lua
local M = {}

---@generic T
---@param array T[]
---@param target T
---@return boolean
function M.contains(array, target)
  for i = 1, #array, 1 do
    if array[i] == target then
      return true
    end
  end
  return false
end

return M
