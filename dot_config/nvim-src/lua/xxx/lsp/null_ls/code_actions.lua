local M = {}

local Log = require "xxx.core.log"

local null_ls = require "null-ls"
local services = require "xxx.lsp.null_ls.services"
local method = null_ls.methods.CODE_ACTION

function M.list_registered(filetype)
    local registered_providers = services.list_registered_providers_names(filetype)
    return registered_providers[method] or {}
end

function M.list_supported(filetype)
    local s = require "null-ls.sources"
    local supported_formatters = s.get_supported(filetype, "code_actions")
    table.sort(supported_formatters)
    return supported_formatters
end

function M.setup(actions_configs)
    if vim.tbl_isempty(actions_configs) then
        return
    end

    local registered = services.register_sources(actions_configs, method)

    if #registered > 0 then
        Log:debug("Registered the following action-handlers: " .. unpack(registered))
    end
end

return M
