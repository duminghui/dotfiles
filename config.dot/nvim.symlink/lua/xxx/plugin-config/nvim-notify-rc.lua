local M = {}

local Log = require "xxx.core.log"
local icons = require "xxx.core.icons"

-- TODO how to config background transparent?
M.opts = {
    ---@usage Animation style one of { "fade", "slide", "fade_in_slide_out", "static" }
    stages = "slide",

    ---@usage Function called when a new window is opened, use for changing win settings/config
    on_open = nil,

    ---@usage Function called when a window is closed
    on_close = nil,

    ---@usage timeout for notifications in ms, default 5000
    timeout = 5000,

    -- Render function for notifications. See notify-render()
    render = "default",

    ---@usage highlight behind the window for stages that change opacity
    background_colour = "Normal",

    ---@usage minimum width for notification windows
    minimum_width = 50,

    ---@usage Icons for the different levels
    icons = {
        ERROR = icons.diagnostics.BoldError,
        WARN = icons.diagnostics.BoldWarning,
        INFO = icons.diagnostics.BoldInformation,
        DEBUG = icons.diagnostics.Debug,
        TRACE = icons.diagnostics.Trace,
    },
}

function M.setup()
    if #vim.api.nvim_list_uis() == 0 then
        -- no need to configure notifications in headless
        Log:debug "headless mode detected, skipping running setup for notify"
        return
    end

    local status_ok, notify = safe_require("notify")
    if not status_ok then
        return
    end

    -- notify.setup(M.opts)

    -- vim.notify = notify
    -- Log:configure_notifications(notify)

    -- require("xxx.plugin-config.notify-updating-demo")
end

return M
