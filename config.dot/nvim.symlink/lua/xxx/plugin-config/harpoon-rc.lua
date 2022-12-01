local M = {}

M.opts = {
    global_settings = {
        save_on_toggle = true,
        mark_branch = true,
        excluded_filetypes = require("xxx.config.exclude-filetypes").harpoon,
        -- excluded_filetypes = {
        --     "harpoon",
        --     "",
        --     "dashboard",
        --     'alpha',
        --     'terminal',
        --     'toggleterm',
        --     'prompt',
        --     'NvimTree',
        --     'Trouble',
        --     "lspinfo",
        --     'lspsaga',
        --     'lspsagaoutline',
        --     'lspsagafinder',
        --     'help',
        --     "startify",
        --     "packer",
        --     "neo-tree",
        --     "neogitstatus",
        --     "lir",
        --     "spectre_panel",
        --     "DressingSelect",
        --     "Jaq",
        --     "harpoon",
        --     "dap-repl",
        --     "dap-terminal",
        --     "dapui_console",
        --     "lab",
        --     "Markdown",
        --     "man",
        --     "mason",
        -- }
    },
}

function M.setup()
    local status_ok, harpoon = safe_require("harpoon")
    if not status_ok then
        return
    end
    harpoon.setup(M.opts)
end

return M
