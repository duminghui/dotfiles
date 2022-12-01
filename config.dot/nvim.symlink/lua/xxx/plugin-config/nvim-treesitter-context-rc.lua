local Log = require "xxx.core.log"

local M = {}

M.opts = {
    mode = "topline",
}

function M.setup()
    local status_ok, context = safe_require("treesitter-context")
    if not status_ok then
        Log:error "Failed to load treesitter-context"
        return
    end

    context.setup(M.opts)

    -- 行数背景色保持一样
    vim.cmd("highlight link TreesitterContextLineNumber TreesitterContext")

end

return M
