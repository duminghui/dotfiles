local M = {}


function M.opts()
    local pre_hook = nil
    local loaded, ts_comment = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
    if loaded and ts_comment then
        pre_hook = ts_comment.create_pre_hook()
    end

    return {
        ---Add a space b/w comment and the line
        ---@type boolean
        padding = true,

        ---Whether cursor should stay at the
        ---same position. Only works in NORMAL
        ---mode mappings
        sticky = true,

        ---Lines to be ignored while comment/uncomment.
        ---Could be a regex string or a function that returns a regex string.
        ---Example: Use '^$' to ignore empty lines
        ---@type string|function
        ignore = "^$",

        ---Whether to create basic (operator-pending) and extra mappings for NORMAL/VISUAL mode
        ---@type table
        mappings = {
            ---operator-pending mapping
            ---Includes `gcc`, `gcb`, `gc[count]{motion}` and `gb[count]{motion}`
            basic = true,
            ---Extra mapping
            ---Includes `gco`, `gcO`, `gcA`
            extra = true,
            ---Extended mapping
            ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
            extended = false,
        },

        ---LHS of line and block comment toggle mapping in NORMAL/VISUAL mode
        ---@type table
        toggler = {
            ---line-comment toggle
            line = "gcc",
            ---block-comment toggle
            block = "gbc",
        },

        ---LHS of line and block comment operator-mode mapping in NORMAL/VISUAL mode
        ---@type table
        opleader = {
            ---line-comment opfunc mapping
            line = "gc",
            ---block-comment opfunc mapping
            block = "gb",
        },

        ---Pre-hook, called before commenting the line
        ---@type function|nil
        pre_hook = pre_hook,

        ---Post-hook, called after commenting is done
        ---@type function|nil
        post_hook = nil,
    }
end

function M.setup()
    local status_ok, comment = safe_require("Comment")
    if not status_ok then
        return
    end

    comment.setup(M.opts())

    local ft = require("Comment.ft")

    ft.set("gomod", "//%s")
end

return M
