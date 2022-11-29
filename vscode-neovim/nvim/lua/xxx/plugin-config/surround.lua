local M = {}

M.opts = {}

M.setup = function()
    local status_ok, surround = safe_require("nvim-surround")
    if not status_ok then
        return
    end

    surround.setup(M.opts)
end

return M
