local M = {}

function M.init()
    local colors = require("xxx.plugin-config.colorscheme.colors").colors()
    local highlight = require("xxx.utils.highlight")
    highlight.highlight("HlDemo1", colors.green, colors.orange, "")
    highlight.highlight("HlDemo2", colors.red, "", "")
    highlight.highlight("HlDemo3", colors.red, colors.blue, "")

    vim.opt.statusline = "%{%v:lua.require'xxx.plugin-config.statusline.demo'.statusline()%}"
end

function M.statusline()
    return "%#HlDemo1#ThisIsOne%#HlDemo2#  This is Tow %#HlDemo3# This is 3%*"
end

return M
