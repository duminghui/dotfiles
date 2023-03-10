local M = {}

M.opts = {
    override = {
        ["tasks.json"] = {
            icon = "ﬥ",
            color = "#cbcb41",
            cterm_color = "185",
            name = "Json5",
        }
    }
}

function M.setup()
    local devicons = require("nvim-web-devicons")
    devicons.setup(M.opts)
end

return M
