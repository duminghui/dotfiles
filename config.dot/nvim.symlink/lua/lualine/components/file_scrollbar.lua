local M = require('lualine.component'):extend()


local default_options = {
    reverse = false
}

function M:init(options)
    M.super.init(self, options)
    self.options = vim.tbl_deep_extend('keep', self.options or {}, default_options)
end

local scrollbar_blocks = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }

function M:update_status()

    local curr_line = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_line_count(0)
    if lines == 0 then
        return ""
    end
    if self.options.reverse then
        return string.rep(scrollbar_blocks[8 - math.floor(curr_line / lines * 7)], 2)
    else
        return string.rep(scrollbar_blocks[math.floor(curr_line / lines * 7) + 1], 2)
    end
end

return M
