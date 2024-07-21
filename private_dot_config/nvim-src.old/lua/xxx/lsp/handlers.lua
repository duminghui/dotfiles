-- Set Default Prefix.
-- Note: You can set a prefix per lsp server in the lv-globals.lua file
local M = {}

-- https://github.com/mrjones2014/dotfiles/blob/master/.config/nvim/lua/my/lsp/utils/init.lua
-- local function setup_async_formatting_handler()
--   -- format on save asynchronously, see lsp/utils/init.lua M.format function
--   -- XXX work on vim.lsp.buf.format({async=true})
--   vim.lsp.handlers["textDocument/formatting"] = function(err, result, ctx)
--     if err ~= nil then
--       vim.api.nvim_err_write(err)
--       return
--     end

--     if result == nil then
--       return
--     end

--     --  format_changedtick must set in vim.b, Key not found: format_changedtick
--     if
--       vim.api.nvim_buf_get_var(ctx.bufnr, "format_changedtick")
--       == vim.api.nvim_buf_get_var(ctx.bufnr, "changedtick")
--     then
--       local view = vim.fn.winsaveview()
--       vim.lsp.util.apply_text_edits(result, ctx.bufnr, "utf-16")
--       vim.fn.winrestview(view)
--       if ctx.bufnr == vim.api.nvim_get_current_buf() then
--         vim.b.format_saving = true
--         vim.cmd.update()
--         vim.b.format_saving = false
--       end
--     end
--   end
-- end

M.opts = {
  hover_float = {
    -- title = ' Hover ',
    focusable = true,
    style = 'minimal',
    border = 'single',
    -- border = 'none',
  },
  signature_help_float = {
    title = ' Signature ',
    focusable = true,
    style = 'minimal',
    border = 'single',
    -- border = 'none',
  },
}

function M.setup()
  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, M.opts.hover_float)
  vim.lsp.handlers['textDocument/signatureHelp'] =
    vim.lsp.with(vim.lsp.handlers.signature_help, M.opts.signature_help_float)
  -- setup_async_formatting_handler()
end

return M
