local M = {}

M.opts = {
    null_ls = {
        enabled = true,
        name = "crates",
    }
}

function M.setup()
    local status_ok, crates = safe_require("crates")
    if not status_ok then
        return
    end
    crates.setup(M.opts)
end

return M
