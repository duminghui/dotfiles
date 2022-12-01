local defaults = {
    "",
    "alpha",
    "checkhealth",
    "DressingInput",
    "DressingSelect",
    'dap-float',
    "dap-repl",
    "dap-terminal",
    "dapui_breakpoints",
    "dapui_console",
    "dapui_scopes",
    "dapui_stacks",
    "dapui_watches",
    "dashboard",
    "dirvish",
    "floaterm",
    "fugitive",
    "gitcommit",
    'glowpreview',
    "guihua",
    "harpoon",
    "help",
    "Jaq",
    "lab",
    'lazygit',
    "lir",
    'lspsaga',
    'lspsagafinder',
    'lspsagaoutline',
    "lspinfo",
    "Markdown",
    "man",
    "mason",
    "minimap",
    "NvimTree",
    "neo-tree",
    "neogitstatus",
    'null-ls-info',
    "Outline",
    "OverseerForm",
    "packer",
    'prompt',
    "qfs",
    'rnvimr',
    "Startify",
    "sagacodeaction",
    "spectre_panel",
    "TelescopePrompt",
    "TelescopeResults",
    'Term',
    "Trouble",
    "terminal",
    "toggleterm",
    'translator',
    'translatorborder',
    'translator_history',
    "tsplayground",
    "undotree",
    'zsh',
}

local function gen_filetypes(include_filetypes, new_exclude_filetypes)
    include_filetypes = include_filetypes or {}
    new_exclude_filetypes = new_exclude_filetypes or {}
    if #include_filetypes == 0 then
        return vim.deepcopy(defaults)
    end

    local result_filetypes = {}

    for _, ft in ipairs(defaults) do
        if not vim.tbl_contains(include_filetypes, ft) then
            table.insert(result_filetypes, ft)
        end
    end
    for _, ft in ipairs(new_exclude_filetypes) do
        if not vim.tbl_contains(defaults, ft) then
            table.insert(result_filetypes, ft)
        end
    end
    return result_filetypes
end

local M = {}

M.autopairs        = gen_filetypes()
M.breadcrumbs      = gen_filetypes()
M.marks            = gen_filetypes({ "Markdown" }, { "plaintext" })
M.harpoon          = gen_filetypes({ "Markdown" })
M.illuminate       = gen_filetypes({ "Markdown" })
M.indent_blankline = gen_filetypes({ "Markdown" })
M.lspsaga          = gen_filetypes({ "Markdown" })
M.scrollbar        = gen_filetypes()

M.lualine = {
    "alpha",
    "TelescopePrompt",
    "packer",
    "sagacodeaction",
}

return M
