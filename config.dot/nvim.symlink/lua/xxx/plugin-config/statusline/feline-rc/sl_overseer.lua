local M = {}

function M.status()
    local ok, _ = safe_require("overseer")
    if not ok then
        return false
    end

    local tasks = require("overseer.task_list")

    if #tasks.list_tasks() == 0 then
        return false
    end

    local util = require("overseer.util")
    local STATUS = require("overseer.constants").STATUS

    local symbols = {
        [STATUS.FAILURE] = " ",
        [STATUS.CANCELED] = " ",
        [STATUS.SUCCESS] = " ",
        [STATUS.RUNNING] = "省",
    }

    local pieces = {}

    local tasks_by_status = util.tbl_group_by(tasks.list_tasks({ unique = true }), "status")
    -- local tasks_by_status = util.tbl_group_by(tasks.list_tasks(), "status")

    local icon = ""

    -- print(vim.inspect(tasks_by_status))

    for _, status in ipairs(STATUS.values) do
        local status_tasks = tasks_by_status[status]
        if symbols[status] and status_tasks then
            print("status", status)
            icon = symbols[status]
            table.insert(pieces, string.format("%s %s", symbols[status], #status_tasks))
            -- return status, symbols[status]
        end
    end
    return table.concat(pieces, " "), icon
end

return M
