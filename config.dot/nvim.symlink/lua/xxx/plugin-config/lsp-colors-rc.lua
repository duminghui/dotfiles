local M = {}

M.opts = {
  Error = "#FFFFFF",
  Warning = "#FFFFFF",
  Information = "#FFFFFF",
  Hint = "#FFFFFF"
  -- Error = "#db4b4b",
  -- Warning = "#e0af68",
  -- Information = "#0db9d7",
  -- Hint = "#10B981"
}

function M.setup()

  local status_ok, lsp_colors = safe_require("lsp-colors")
  if not status_ok then
    return
  end
  lsp_colors.setup(M.opts)
end

return M
