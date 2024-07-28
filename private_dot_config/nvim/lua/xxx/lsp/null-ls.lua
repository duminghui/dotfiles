local M = {}

---@param ft string
---@return table table
M.list_registered_providers_names = function(ft)
  local ok, s = pcall(require, "null-ls.sources")
  if not ok then
    return {}
  end
  local available_sources = s.get_available(ft)
  local registered = {}
  for _, source in ipairs(available_sources) do
    for method in pairs(source.methods) do
      registered[method] = registered[method] or {}
      table.insert(registered[method], source.name)
    end
  end
  return registered
end

---@param ft string
---@param method 'code-action'|'formatter' | 'linter'
---@return table
M.list_registered = function(ft, method)
  local registered_providers = M.list_registered_providers_names(ft)
  local tbl = require("xxx.core.table")
  if tbl.len(registered_providers) == 0 then
    return {}
  end
  local nl_methods = require("null-ls").methods
  local switch = {
    ["code-action"] = {
      nl_methods.CODE_ACTION,
    },
    ["formatter"] = {
      nl_methods.FORMATTING,
    },
    ["linter"] = {
      nl_methods.DIAGNOSTICS,
      nl_methods.DIAGNOSTICS_ON_OPEN,
      nl_methods.DIAGNOSTICS_ON_SAVE,
    },
  }

  local providers_for_methods = vim
    .iter(vim.tbl_map(function(m)
      return registered_providers[m] or {}
    end, switch[method] or {}))
    :flatten()
    :totable()

  return providers_for_methods
end

return M
