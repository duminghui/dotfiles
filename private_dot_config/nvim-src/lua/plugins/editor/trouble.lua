---require("trouble")
local M = {}
---@param opts trouble.Config
function M.opts(_, opts)
  local icons = require("xxx.core.icons")
  ---@type trouble.Config
  local opts_new = {
    auto_close = false, -- auto close when there are no items
    auto_open = false, -- auto open when there are items
    auto_preview = true, -- automatically open preview when on an item
    auto_refresh = false, -- auto refresh when open
    auto_jump = true, -- auto jump to the item when there's only one
    focus = true, -- Focus the window when opened
    restore = true, -- restores the last location in the list when opening
    follow = false, -- Follow the current item
    indent_guides = true, -- show indent guides
    max_items = 200, -- limit number of items that can be displayed per section
    multiline = true, -- render multi-line messages
    pinned = false, -- When pinned, the opened trouble window will be bound to the current buffer
    warn_no_results = true, -- show a warning when there are no results
    open_no_results = false, -- open the trouble window when there are no results
    ---@type trouble.Window.opts
    win = {
      _name = "opts: win",
      position = "bottom",
      wo = {
        colorcolumn = "",
        winblend = 0, -- why not work?
        -- winhighlight = 'Normal:TroubleNormal,NormalNC:TroubleNormalNC,EndOfBuffer:TroubleNormal',
        -- winhighlight = 'NormalNC:TroubleNormalNC',
        -- fix background is fill color
        winhighlight = "",
        -- wrap = true,
      },
    }, -- window options for the results window. Can be a split or a floating window.
    -- Window options for the preview window. Can be a split, floating window,
    -- or `main` to show the preview in the main editor window.
    ---@type trouble.Window.opts
    preview = {
      _name = "opts: preview",
      type = "main",
      -- when a buffer is not yet loaded, the preview window will be created
      -- in a scratch buffer with only syntax highlighting enabled.
      -- Set to false, if you want the preview to always be a real loaded buffer.
      scratch = true,
      wo = {
        winblend = 0, -- background will black
      },
    },
    icons = {
      ---@type trouble.Indent.symbols
      indent = {
        fold_open = icons.ui.ChevronDown .. " ",
        fold_closed = icons.ui.ChevronRight .. " ",
      },
      folder_closed = icons.ui.Folder .. " ",
      folder_open = icons.ui.FolderOpen .. " ",
      kinds = icons.kind,
    },
  }
  return vim.tbl_deep_extend("force", opts, opts_new)
end
return {
  "folke/trouble.nvim",
  opts = M.opts,
}
