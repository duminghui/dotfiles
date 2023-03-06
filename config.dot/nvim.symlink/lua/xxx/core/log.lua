local Log = {}

---@param msg any
---@param opts nil|table
function Log:trace(msg, opts)
    vim.schedule(function()
        vim.notify(msg, vim.log.levels.TRACE, opts)
    end)
end

---Add a log entry at DEBUG level
---@param msg any
---@param opts nil|table
function Log:debug(msg, opts)
    vim.schedule(function()
        vim.notify(msg, vim.log.levels.DEBUG, opts)
    end)
end

---Add a log entry at INFO level
---@param msg any
---@param opts nil|table
function Log:info(msg, opts)
    vim.schedule(function()
        vim.notify(msg, vim.log.levels.INFO, opts)
    end)
end

---Add a log entry at WARN level
---@param msg any
---@param opts nil|table
function Log:warn(msg, opts)
    vim.schedule(function()
        vim.notify(msg, vim.log.levels.WARN, opts)
    end)
end

---Add a log entry at ERROR level
---@param msg any
---@param opts nil|table
function Log:error(msg, opts)
    vim.schedule(function()
        vim.notify(msg, vim.log.levels.ERROR, opts)
    end)
end

setmetatable({}, Log)

return Log
