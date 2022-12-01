local M = {}
local highlight = require("xxx.utils.highlight")

local function evaluate_if_function(key, ...)
    if type(key) == 'function' then
        return key(...)
    else
        return key
    end
end

---
---@param hl table|fun()|string
---@param parent_hl table|nil
---@return table
local function parse_hl(hl, parent_hl)
    hl = evaluate_if_function(hl)
    if type(hl) == 'string' then
        hl = highlight.get_hl_by_name(hl)
    end
    hl = highlight.sanitize_hl(hl, parent_hl)
    return hl
end

local function parse_icon(icon, parent_hl)
    if icon == nil then
        return ''
    end

    icon = evaluate_if_function(icon)
    local hl, str
    if type(icon) == 'string' then
        str = icon
        hl = parent_hl
    else
        str = evaluate_if_function(icon.str) or ''
        hl = parse_hl(icon.hl, parent_hl)
    end

    return string.format('%s%s', highlight.format_statusline_hl(hl), str)
end

local function parse_content(content)
    if content == nil then
        return ''
    elseif type(content) == 'string' then
        return content
    elseif type(content) == 'function' then
        return content()
    end
    return ''
end

-- local _parts_templace = {
--     {
--         icon = { str = "X", hl = {} }, -- table | function | string
--         str = "", -- fkunction | string
--         hl = {},
--     },
--     {},
-- }


function M.provider(component, opts)
    local parts = opts.parts or {}
    local sep = opts.sep or ' '
    if #parts == 0 then
        return ""
    end
    local com_hl = parse_hl(component.hl)

    local result = {}
    for _, part in ipairs(parts) do
        local part_hl = parse_hl(part.hl, com_hl)

        local content, icon2 = parse_content(part.content)
        local icon       = icon2 and icon2 ~= '' and icon2 or part.icon
        icon             = parse_icon(icon, part_hl)

        local part_content = string.format("%s%s%s", icon, highlight.format_statusline_hl(part_hl), content)
        table.insert(result, part_content)
    end
    local sep_hl = highlight.format_statusline_hl(com_hl) .. sep
    return sep_hl .. table.concat(result, sep) .. sep_hl
end

return M
