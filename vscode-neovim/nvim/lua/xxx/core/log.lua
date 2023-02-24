local Log = {}

---@param msg any
---@param event any
function Log:trace(msg, opts)
    vim.notify(msg, vim.log.levels.TRACE, opts)
    -- self:add_entry(self.levels.TRACE, msg, event)
end

---Add a log entry at DEBUG level
---@param msg any
---@param event any
function Log:debug(msg, opts)
    vim.notify(msg, vim.log.levels.DEBUG, opts)
    -- self:add_entry(self.levels.DEBUG, msg, event)
end

---Add a log entry at INFO level
---@param msg any
---@param event any
function Log:info(msg, opts)
    vim.notify(msg, vim.log.levels.INFO, opts)
    -- self:add_entry(self.levels.INFO, msg, event)
end

---Add a log entry at WARN level
---@param msg any
---@param event any
function Log:warn(msg, opts)
    vim.notify(msg, vim.log.levels.WARN, opts)
    -- self:add_entry(self.levels.WARN, msg, event)
end

---Add a log entry at ERROR level
---@param msg any
---@param event any
function Log:error(msg, opts)
    vim.notify(msg, vim.log.levels.ERROR, opts)
    -- self:add_entry(self.levels.ERROR, msg, event)
end

setmetatable({}, Log)

return Log
