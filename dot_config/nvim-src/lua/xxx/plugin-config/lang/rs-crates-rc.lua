local M = {}

M.opts = {
    null_ls = {
        enabled = true,
        name = "crates",
    }
}

function M.setup()
    local crates = require("crates")
    crates.setup(M.opts)
end

return M
