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
    local status_ok, devicons = safe_require("nvim-web-devicons")
    if not status_ok then
        return
    end
    devicons.setup(M.opts)

end

return M
