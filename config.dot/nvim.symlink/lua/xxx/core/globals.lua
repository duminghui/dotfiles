---Require a module using [pcall] and report any errors
---@param module string
---@param opts table?
---@return boolean, any
function _G.safe_require(module, opts)
    -- print(module)
    opts = opts or { silent = false }
    local ok, result = pcall(require, module)
    -- print("require:", module)
    if not ok and not opts.silent then
        vim.schedule(function()
            vim.notify(result, vim.log.levels.ERROR, { title = string.format("Error requiring: %s", module) })
        end)
    end
    return ok, result
end

---Return true if any pattern in the tbl matches the provided value
---@param tbl table
---@param val string
---@return boolean
function _G.find_pattern_match(tbl, val)
    return tbl and next(vim.tbl_filter(function(pattern)
        return val:match(pattern)
    end, tbl))
end

local uv = vim.loop
local path_sep = uv.os_uname().version:match "Windows" and "\\" or "/"
---Join path segments that were passed as input
---@return string
function _G.join_paths(...)
    local result = table.concat({ ... }, path_sep)
    return result
end
