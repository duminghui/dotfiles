local M = {}

local highlight = require("xxx.utils.highlight")

local b = vim.b

function M.git_info_exists()
    return b.gitsigns_head or b.gitsigns_status_dict
end

function M.git_provider(component, is_short)
    local gitsigns = b.gitsigns_status_dict
    if not gitsigns then
        return ""
    end
    local opts = component.opts or {}
    local result = {}
    for _, name in ipairs { "branch", "added", "changed", "removed" } do
        local diff_hls = opts.diff_hls
        local hl_name = highlight.format_statusline_hl(diff_hls[name])
        if name == "branch" then
            local branch = b.gitsigns_head or ''
            local symbol = opts.symbols[name] or ""
            table.insert(result, hl_name .. ' ' .. symbol .. " " .. branch)
        else
            local value = gitsigns[name]
            if value and value > 0 then
                if is_short then
                    local symbol = opts.short_symbols[name] or ""
                    table.insert(result, hl_name .. symbol .. value)
                else
                    local symbol = opts.symbols[name] or ""
                    table.insert(result, hl_name .. symbol .. " " .. value)
                end
            end
        end
    end
    if #result > 0 then
        return table.concat(result, ' ') .. " "
    else
        return ''
    end
end

return M
