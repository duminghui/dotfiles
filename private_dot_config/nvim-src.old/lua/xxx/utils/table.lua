local Table = {}

--- Find the first entry for which the predicate returns true.
-- @param t The table
-- @param predicate The function called for each entry of t
-- @return The entry for which the predicate returned True or nil
function Table.find_first(t, predicate)
  for _, entry in pairs(t) do
    if predicate(entry) then
      return entry
    end
  end
  return nil
end

--- Check if the predicate returns True for at least one entry of the table.
-- @param t The table
-- @param predicate The function called for each entry of t
-- @return True if predicate returned True at least once, false otherwise
function Table.contains(t, predicate)
  return Table.find_first(t, predicate) ~= nil
end

function Table.len(tbl)
  if type(tbl) ~= 'table' then
    return 0
  end
  local len = 0
  for _, _ in pairs(tbl) do
    len = len + 1
  end
  return len
end

return Table
