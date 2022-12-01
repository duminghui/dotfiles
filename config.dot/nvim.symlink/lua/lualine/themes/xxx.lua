local colors = require("xxx.plugin-config.colorscheme.colors").colors()
return {
    normal = {
        a = { bg = colors.purple, fg = colors.bg, gui = 'bold' },
        b = { bg = colors.bg, fg = colors.gray },
        c = { bg = colors.bg, fg = colors.gray }
    },
    insert = {
        a = { bg = colors.green, fg = colors.bg, gui = 'bold' },
        -- b = { bg = colors.lightgray, fg = colors.white },
        -- c = { bg = colors.lightgray, fg = colors.white }
    },
    visual = {
        a = { bg = colors.orange, fg = colors.bg, gui = 'bold' },
        -- b = { bg = colors.lightgray, fg = colors.white },
        -- c = { bg = colors.inactivegray, fg = colors.black }
    },
    replace = {
        a = { bg = colors.green, fg = colors.bg, gui = 'bold' },
        -- b = { bg = colors.lightgray, fg = colors.white },
        -- c = { bg = colors.black, fg = colors.white }
    },
    command = {
        a = { bg = colors.purple, fg = colors.bg, gui = 'bold' },
        -- b = { bg = colors.lightgray, fg = colors.white },
        -- c = { bg = colors.inactivegray, fg = colors.black }
    },
    -- inactive = {
    --     a = { bg = colors.darkgray, fg = colors.gray, gui = 'bold' },
    --     b = { bg = colors.darkgray, fg = colors.gray },
    --     c = { bg = colors.darkgray, fg = colors.gray }
    -- }
}
