local notify_ok, notify = pcall(require, "notify")
if not notify_ok then
    notify = vim.notify
end

local spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }

---@class ProgressNotify
local ProgressNotify = {
    is_finish = false,
    spinner = 1,
}

function ProgressNotify:_update_spinner()
    if not self.is_finish then
        local new_spinnter = (self.spinner + 1) % #spinner_frames
        self.spinner = new_spinnter
        self.notificate = notify(nil, nil, {
            hide_from_history = true,
            icon = spinner_frames[new_spinnter],
            replace = self.notificate,
        })
        vim.defer_fn(function()
            self:_update_spinner()
        end, 100)
    end
end

function ProgressNotify:start(title, msg)
    title = title or "NO TITLE"
    msg = msg or "NO MESSAGE"
    self.notificate = notify(msg, "info", {
        title = title,
        icon = spinner_frames[1],
        timeout = false,
        hide_from_history = false,
    })
    self.spinner = 1
    if notify_ok then
        self:_update_spinner()
    end
end

local icons = require("xxx.core.icons")

function ProgressNotify:finish(msg, level, icon)
    icon = icon or ""
    icon = icon == "" and icons.ui.CircleCheck or icon
    msg = msg or "NO MESSAGE"
    level = level or "info"
    self.is_finish = true
    self.notificate = notify(msg, level, {
        icon = icon,
        replace = self.notificate,
        hide_from_history = false,
        timeout = 3000,
    })
end

function ProgressNotify:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

return ProgressNotify
