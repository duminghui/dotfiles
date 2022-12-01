local M = require('lualine.component'):extend()

function M:update_status()
    local curr_line = vim.api.nvim_win_get_cursor(0)[1]
    local total = vim.api.nvim_buf_line_count(0)
    local percent = string.format("%s", 100)

    if curr_line ~= total then
        percent = string.format("%3d", math.ceil(curr_line / total * 99))
    end
    return percent .. "%%|" .. total

end

return M
