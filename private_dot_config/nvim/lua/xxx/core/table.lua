local M = {}

function M.len(tbl)
  if type(tbl) ~= "table" then
    return 0
  end
  local len = 0
  for _, _ in pairs(tbl) do
    len = len + 1
  end
  return len
end

return M
