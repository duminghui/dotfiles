local M = {}

local loaded_highlights = {}

local function add_hl(name, fg, bg, gui)
    local cmd = string.format('highlight %s guifg=%s guibg=%s gui=%s', name, fg, bg, gui)
    vim.api.nvim_command(cmd)

    loaded_highlights[name] = {
        name = name,
        fg = fg,
        bg = bg,
        gui = gui,
    }
end

function M.format_statusline_hl(hl)
    local hl_name = M.get_hl_name(hl)
    local str = string.format("%%#%s#", hl_name)
    return str
end

function M.sanitize_hl(hl, parent_hl)
    hl = hl or {}
    parent_hl = parent_hl or {}
    local name = hl.name or ""
    local fg = hl.fg or parent_hl.fg or "None"
    local bg = hl.bg or parent_hl.bg or "None"
    local gui = hl.gui or "None"
    if name == nil or name == '' then
        -- If first character of the color starts with '#', remove the '#' and keep the rest
        -- If it doesn't start with '#', do nothing
        local fg_str = fg:sub(1, 1) == '#' and fg:sub(2) or fg
        local bg_str = bg:sub(1, 1) == '#' and bg:sub(2) or bg
        local gui_str = string.gsub(gui, ",", "_")

        -- Generate unique hl name from color strings if a name isn't provided
        name = string.format(
            'XXX_hl_%s_%s_%s',
            fg_str:upper(),
            bg_str:upper(),
            gui_str:upper()
        )

    end
    return {
        name = name,
        fg = fg,
        bg = bg,
        gui = gui,
    }
end

--- @param hl table|string fg, bg, gui
--- @return string
function M.get_hl_name(hl)
    if type(hl) == 'string' then
        return hl
    end

    -- If highlight name exists and is cached, just return it
    if hl.name and loaded_highlights[hl.name] then
        return hl.name
    end

    hl = M.sanitize_hl(hl)


    if not loaded_highlights[hl.name] then
        add_hl(hl.name, hl.fg, hl.bg, hl.gui)
    end

    return hl.name
end

function M.get_hl_by_name(hl_name)
    if vim.fn.hlexists(hl_name) == 0 then
        return {}
    end
    if hl_name and loaded_highlights[hl_name] then
        return loaded_highlights[hl_name]
    end
    local attrs = vim.api.nvim_get_hl_by_name(hl_name, true)
    local styles = {}
    for k, v in ipairs(attrs) do
        if v == true then
            styles[#styles + 1] = k
        end
    end
    local hl = {
        name = hl_name,
        fg = attrs.foreground and string.format("#%06x", attrs.foreground),
        bg = attrs.background and string.format("#%06x", attrs.background),
        -- sp = attrs.special and string.format('#%06x', attrs.special),
        gui = next(styles) and table.concat(styles, ",") or nil,
    }
    loaded_highlights[hl_name] = hl
    return hl
end

--- new highlight from parent and extend default by scope
--- @param name string hl name
--- @param scope string|table fg, bg, gui, which get from parent highlight
--- @param parent_hl_name string  parent highlight
--- @param default table fg, bg, gui
--- @return table
function M.highlight_from_parent(name, scope, parent_hl_name, default)
    local new_hl = loaded_highlights[name]
    if new_hl then
        return new_hl
    end
    new_hl = {}
    scope = type(scope) == 'string' and { scope } or scope
    local hl = M.get_hl_by_name(parent_hl_name)
    if hl ~= nil then
        for _, sc in ipairs(scope) do
            new_hl[sc] = hl[sc]
        end
        --     new_hl = vim.tbl_deep_extend("force", default, new_hl)
        -- else
        --     new_hl = default
    end
    if name and name ~= "" then
        new_hl.name = name
    end
    new_hl = M.sanitize_hl(new_hl, default)
    local hl_name = M.get_hl_name(new_hl)
    new_hl.name = hl_name
    return new_hl
end

return M
