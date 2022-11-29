local M = {}

--- Load the default set of autogroups and autocommands.
function M.load_defaults()

    local definitions = {
        {
            "TextYankPost",
            {
                group = "_general_settings",
                pattern = "*",
                desc = "Highlight text on yank",
                callback = function()
                    require("vim.highlight").on_yank { higroup = "Search", timeout = 200 }
                end,
            },
        },
        {
            "VimResized",
            {
                group = "_auto_resize",
                pattern = "*",
                command = "tabdo wincmd =",
            },
        },
    }

    M.define_autocmds(definitions)
end

--- Create autocommand groups based on the passed definitions
--- Also creates the augroup automatically if it doesn't exist
---@param definitions table contains a tuple of event, opts, see `:h nvim_create_autocmd`
function M.define_autocmds(definitions)
    for _, entry in ipairs(definitions) do
        local event = entry[1]
        local opts = entry[2]
        if type(opts.group) == "string" and opts.group ~= "" then
            local exists, _ = pcall(vim.api.nvim_get_autocmds, { group = opts.group })
            if not exists then
                vim.api.nvim_create_augroup(opts.group, {})
            end
        end
        vim.api.nvim_create_autocmd(event, opts)
    end
end

return M
