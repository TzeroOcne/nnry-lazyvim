local contains = require "utils.contains".contains
local M = {}

M.contains = contains

---@generic T
---@param items T[]
function M.print_all(items)
  for i = 1, #items, 1 do
    print(items[i])
  end
end

---@param item table
---@param indent? integer
---@param done? table
---@return string
function M.dumps (item, indent, done)
  done = done or {}
  indent = indent or 2
  if type(item) == "table" then
    local sb = {}
    table.insert(sb, "{\n")
    for key, value in pairs (item) do
      table.insert(sb, string.rep (" ", indent)) -- indent it
      if type (value) == "table" and not done [value] then
        done [value] = true
        table.insert(sb, key .. " = ");
        table.insert(sb, M.dumps (value, indent + 2, done))
        table.insert(sb, string.rep (" ", indent)) -- indent it
      elseif "number" == type(key) then
        table.insert(sb, string.format("\"%s\"\n", tostring(value)))
      else
        table.insert(sb, string.format(
            "%s = \"%s\"\n", tostring (key), tostring(value)))
       end
    end
    table.insert(sb, "}\n")
    return table.concat(sb)
  else
    return item .. "\n"
  end
end

return M
