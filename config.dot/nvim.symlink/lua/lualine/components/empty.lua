local M = require('lualine.component'):extend()

function M:draw(default_highlight)
    self.status = ''
    self.applied_separator = ''
    self:apply_highlights(default_highlight)
    self:apply_section_separators()
    return self.status
end

return M
