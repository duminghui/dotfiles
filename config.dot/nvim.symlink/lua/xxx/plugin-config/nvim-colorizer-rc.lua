local M = {}

function M.setup()
    local status_ok, colorizer = safe_require("colorizer")
    if not status_ok then
        return
    end

    colorizer.setup()
end

return M
