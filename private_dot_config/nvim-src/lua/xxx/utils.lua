local uv = vim.loop
local M = {}

--- Checks whether a given path exists and is a file.
-- @param path (string) path to check
-- @returns (bool)
function M.is_file(path)
  local stat = uv.fs_stat(path)
  return stat and stat.type == 'file' or false
end

--- Checks whether a given path exists and is a directory
-- @param path (string) path to check
-- @returns (bool)
function M.is_directory(path)
  local stat = uv.fs_stat(path)
  return stat and stat.type == 'directory' or false
end

function M.color_hex(val)
  if not val then
    return 'none'
  end
  return string.format('#%X', val)
end

---Write data to a file
---@param path string can be full or relative to `cwd`
---@param txt string|table text to be written, uses `vim.inspect` internally for tables
---@param flag string used to determine access mode, common flags: "w" for `overwrite` or "a" for `append`
function M.write_file(path, txt, flag)
  local data = type(txt) == 'string' and txt or vim.inspect(txt)
  uv.fs_open(path, flag, 438, function(open_err, fd)
    assert(not open_err, open_err)
    uv.fs_write(fd, data, -1, function(write_err)
      assert(not write_err, write_err)
      uv.fs_close(fd, function(close_err)
        assert(not close_err, close_err)
      end)
    end)
  end)
end

function M.fif(condition, t, f)
  if condition then
    return t
  else
    return f
  end
end

function M.printMetaTableFun(t)
  local rs_tb = {}
  local function tmp(_t)
    if _t then
      for _val, _val_type in pairs(_t) do
        if type(_val_type) ~= 'userdata' then
          if not string.find(_val, '_') then
            table.insert(rs_tb, _val)
          end
        end
      end
      local ft = getmetatable(_t)
      if ft then
        tmp(ft)
      end
    end
  end
  tmp(getmetatable(t))
  table.sort(rs_tb)
  local rs_str = ''
  for i = 1, #rs_tb do
    rs_str = rs_str .. rs_tb[i] .. '\n'
  end
  print('printMetaTableFun:', rs_str)
end

return M
