local M = {}

-- local colors = require("xxx.core.colors")

M.opts = {
  style = 'darker',
  lualine = {
    transparent = false,
  },
  diagnostics = {
    -- background = false,
  },
  highlights = {
    CursorLineNr = { fg = "#FFD700" },
  },

}

function M.setup()

  local status_ok, onedark = safe_require("onedark")
  if not status_ok then
    return
  end
  onedark.setup(M.opts)
  onedark.load()

  vim.g.colors_name = "onedark"

  -- vim.cmd(string.format("highlight CursorLineNr guifg=%s", "#FFD700"))
  -- 会把整个替换掉
  -- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFE700" })

  -- for lualine
  require("xxx.plugin-config.statusline.lualine-rc.components").set_highlight()
  require("xxx.plugin-config.treesitter-rc").set_rainbow_highlight()
  require("xxx.plugin-config.indent-blankline-rc").set_highlight()
end

return M
