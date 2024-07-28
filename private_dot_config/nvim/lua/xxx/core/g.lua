_G.xxx = {
  icons = require("xxx.core.icons"),
}

-- local path_sep = vim.uv.os_uname().version:match("Windows") and "\\" or "/"
---Join path segments that were passed as input
---@return string
function _G.join_paths(...)
  local Path = require("plenary.path")
  return Path:new(...).filename

  -- local result = table.concat({ ... }, path_sep)
  -- return result
end

---@param keymaps table[]
function _G.keymappings(keymaps)
  for _, keymap in ipairs(keymaps) do
    local mode = keymap[1]
    local lhs = keymap[2]
    local rhs = keymap[3]
    local opts = keymap[4]
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

---@param keymaps table[]
function _G.del_keymappings(keymaps)
  for _, keymap in ipairs(keymaps) do
    local mode = keymap[1]
    local lhs = keymap[2]
    local opts = keymap[3]
    vim.keymap.del(mode, lhs, opts)
  end
end
