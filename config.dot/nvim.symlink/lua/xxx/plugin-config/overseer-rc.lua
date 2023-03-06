local M = {}

M.opts = {
    task_list = {
        -- Default detail level for tasks. Can be 1-3.
        default_detail = 2,
        -- Set keymap to false to remove default behavior
        -- You can add custom keymaps here as well (anything vim.keymap.set accepts)
        bindings = {
            ["?"] = "ShowHelp",
            ["<CR>"] = "RunAction",
            ["<C-e>"] = "Edit",
            ["o"] = "Open",
            ["<C-v>"] = "OpenVsplit",
            ["<C-s>"] = "OpenSplit",
            ["<C-f>"] = "OpenFloat",
            ["<C-q>"] = "OpenQuickFix",
            ["p"] = "TogglePreview",
            --   ["<C-l>"] = "IncreaseDetail",
            --   ["<C-h>"] = "DecreaseDetail",
            --   ["L"] = "IncreaseAllDetail",
            --   ["H"] = "DecreaseAllDetail",
            ["L"] = "IncreaseDetail",
            ["H"] = "DecreaseDetail",
            ["["] = "DecreaseWidth",
            ["]"] = "IncreaseWidth",
            ["{"] = "PrevTask",
            ["}"] = "NextTask",
        }, -- Default direction. Can be "left" or "right"
        direction = "right"
    }
}

function M.setup()
    local overseer = require("overseer")
    overseer.setup(M.opts)
    -- overseer.setup()
end

return M
