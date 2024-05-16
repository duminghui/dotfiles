local M = {}

M.opts = {
    -- providers: provider used to get references in the buffer, ordered by priority
    providers = {
        "lsp",
        "treesitter",
        "regex",
    },
    -- delay: delay in milliseconds
    delay = 120,
    -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
    filetypes_denylist = require("xxx.config.exclude-filetypes").illuminate,
    -- filetypes_denylist = {
    --     "dirvish",
    --     "fugitive",
    --     "alpha",
    --     "NvimTree",
    --     "packer",
    --     "neogitstatus",
    --     "Trouble",
    --     "lir",
    --     "Outline",
    --     "spectre_panel",
    --     "toggleterm",
    --     "DressingSelect",
    --     "TelescopePrompt",
    -- },
    -- filetypes_allowlist: filetypes to illuminate, this is overriden by filetypes_denylist
    filetypes_allowlist = {},
    -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
    modes_denylist = {},
    -- modes_allowlist: modes to illuminate, this is overriden by modes_denylist
    modes_allowlist = {},
    -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
    -- Only applies to the 'regex' provider
    -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
    providers_regex_syntax_denylist = {},
    -- providers_regex_syntax_allowlist: syntax to illuminate, this is overriden by providers_regex_syntax_denylist
    -- Only applies to the 'regex' provider
    -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
    providers_regex_syntax_allowlist = {},
    -- under_cursor: whether or not to illuminate under the cursor
    under_cursor = true,
}

function M.setup()
    local illuminate = require("illuminate")

    illuminate.configure(M.opts)

    -- if not require('illuminate.util').has_keymap('n', '<a-n>') then
    --     vim.keymap.set('n', '<a-n>', require('illuminate').goto_next_reference, { desc = "Move to next reference" })
    -- end
    -- if not require('illuminate.util').has_keymap('n', '<a-p>') then
    --     vim.keymap.set('n', '<a-p>', require('illuminate').goto_prev_reference, { desc = "Move to previous reference" })
    -- end
    -- if not require('illuminate.util').has_keymap('o', '<a-i>') then
    --     vim.keymap.set('o', '<a-i>', require('illuminate').textobj_select)
    -- end
    -- if not require('illuminate.util').has_keymap('x', '<a-i>') then
    --     vim.keymap.set('x', '<a-i>', require('illuminate').textobj_select)
    -- end
end

return M
