local M = {}

local lsp = require("xxx.lsp")

M.opts = {
    tools = {
        inlay_hints = {
            show_parameter_hints = true,
            right_align = false,
        },
        hover_actions = {
            auto_focus = true,
        },
    },
    server = {
        standalone = false,
        settings = {
            ['rust-analyzer'] = {
                rustfmt = {
                    extraArgs = { "+nightly" },
                    -- overrideCommand = "XXXXX",

                },
            },
        },
        capabilities = lsp.common_capabilities(),
        on_attach = function(client, bufnr)
            local keymappings = require("xxx.lsp.keymappings")
            keymappings.add_lsp_buffer_keybindings(client, bufnr)
            keymappings.set_keymap(bufnr, "n", "gA", ":RustHoverActions<CR>", "RustHoverActions")
            keymappings.set_keymap(bufnr, "n", "gC", ":RustOpenCargo<CR>", "RustOpenCargo")
            keymappings.set_keymap(bufnr, "n", "gD", ":RustDebuggables<CR>", "RustDebuggables")
            keymappings.set_keymap(bufnr, "n", "gR", ":RustRunnables<CR>", "RustRunnables")
            keymappings.set_keymap(bufnr, "n", "gM", ":RustExandMacro<CR>", "RustExandMacro")
            keymappings.set_keymap(bufnr, "n", "gK", ":RustOpenExternalDocs<CR>", "Open doc in docs.rs")
            local lu = require "xxx.lsp.utils"
            lu.setup_document_highlight(client, bufnr)
            lu.setup_format_on_save(client, bufnr)
            lu.setup_fold()
            lsp.add_lsp_buffer_options(bufnr)
        end,
    }
}

function M.setup()
    local rust_tools = require("rust-tools")
    rust_tools.setup(M.opts)
end

return M
