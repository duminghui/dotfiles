local M = {}

local highlight = require("xxx.utils.highlight")

function M.is_diagnostics_attached()
    local diagnostics = vim.diagnostic.get(0)
    return diagnostics and #diagnostics > 0
end

local last_diagnostcis_count = {}

function M.diagnostics_provider(component, is_short)
    local opts = component.opts or {}
    local bufnr = vim.api.nvim_get_current_buf()
    local diagnostics_count
    if opts.update_in_insert or vim.api.nvim_get_mode().mode:sub(1, 1) ~= "i" then
        local count = { 0, 0, 0, 0 }
        local diagnostics = vim.diagnostic.get(0)
        for _, diagnostic in ipairs(diagnostics) do
            count[diagnostic.severity] = count[diagnostic.severity] + 1
        end
        diagnostics_count = {
            error = count[vim.diagnostic.severity.ERROR],
            warn = count[vim.diagnostic.severity.WARN],
            info = count[vim.diagnostic.severity.INFO],
            hint = count[vim.diagnostic.severity.HINT],
        }
        last_diagnostcis_count[bufnr] = diagnostics_count
    else
        diagnostics_count = last_diagnostcis_count[bufnr] or { error = 0, warn = 0, info = 0, hint = 0 }
    end

    local result = {}

    for _, section in ipairs(opts.sections) do
        local count = diagnostics_count[section]
        if count ~= nil and count > 0 then
            -- hl = {
            --     scope = "fg",
            --     parent = "XXXX",
            --     bg = "#XXXXX",
            -- }
            local hl = opts.hls[section]
            hl = highlight.highlight_from_parent("XXX_hl_stl_diagnostic_" .. section, hl.scope, hl.parent, hl)
            if is_short then
                table.insert(result,
                    highlight.format_statusline_hl(hl.name) .. ' ' .. count)
            else
                local symbol = opts.symbols[section]
                table.insert(result,
                    highlight.format_statusline_hl(hl.name) .. ' ' .. symbol .. ' ' .. count)
            end

        end
    end
    if #result > 0 then
        return table.concat(result, '') .. ' '
    else
        return ''
    end
end

function M.is_lsp_info_attached()
    return next(vim.lsp.get_active_clients({ bufnr = 0 })) ~= nil
end

function M.lsp_info_provider(component)
    local opts = component.opts or {}
    local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
    if not buf_clients or #buf_clients == 0 then
        return "Inactive "
    end
    local buf_ft = vim.bo.filetype
    local buf_client_names = {}
    local copilot_active = false
    for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" then
            table.insert(buf_client_names, client.name)
        end
        if client.name == "copilot" then
            copilot_active = true
        end
    end

    -- add formatter
    local formatters = require "xxx.lsp.null_ls.formatters"
    local supported_formatters = formatters.list_registered(buf_ft)
    vim.list_extend(buf_client_names, supported_formatters)

    -- add linter
    local linters = require "xxx.lsp.null_ls.linters"
    local supported_linters = linters.list_registered(buf_ft)
    vim.list_extend(buf_client_names, supported_linters)

    -- add code action
    local code_actions = require "xxx.lsp.null_ls.code_actions"
    local supported_code_actions = code_actions.list_registered(buf_ft)
    vim.list_extend(buf_client_names, supported_code_actions)


    local unique_client_names = vim.fn.uniq(buf_client_names)

    local language_servers = "[" .. table.concat(unique_client_names, ",") .. "]"

    if copilot_active then
        local copilot = opts.clients["copilot"]
        language_servers = language_servers ..
            highlight.format_statusline_hl(copilot.hl) .. " " .. copilot.symbol -- .. "%*"
    end

    return language_servers .. " "
end

return M
