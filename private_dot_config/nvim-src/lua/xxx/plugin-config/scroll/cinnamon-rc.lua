local M = {}

-- BASIC KEYMAPS ~
--   -----------------------------------------------------------------------
--   Movement Type                       Keys
--   ----------------------------------- -----------------------------------
--   Half-window movements               <C-U> and <C-D>
--   Page movements                      <C-B>, <C-F>, <PageUp> and
--                                       <PageDown>
--   Paragraph movements                 { and }
--   Prev/next search result             n, N, *, #, g* and g#
--   Prev/next cursor location           <C-O> and <C-I>
--   -----------------------------------------------------------------------
--
-- EXTRA KEYMAPS ~
--   -----------------------------------------------------------------------
--   Movement Type                       Keys
--   ----------------------------------- -----------------------------------
--   Start/end of file                   gg and G
--   Line number                         [count]gg and [count]G
--   Start/end of line                   0, ^ and $
--   Screen scrolling                    zz, zt, zb, z., z<CR>, z-, z^, z+,
--                                       <C-Y> and <C-E>
--   Horizontal scrolling                zH, zL, zs, ze, zh and zl
--   Up/down movements                   [count]j, [count]k, [count]<Up>,
--                                       [count]<Down>, [count]gj,
--                                       [count]gk, [count]g<Up> and
--                                       [count]g<Down>
--   Left/right movements                [count]h, [count]l, [count]<Left>
--                                       and [count]<Right>

M.opts = {
  disabled = false,
  keymaps = {
    basic = true,
    extra = true,
  },
  options = {
    callback = nil,
    delay = 1,
    max_delta = {
      line = 150,
      column = 200,
    },
  },
}

function M.setup()
  local cinnamon = require('cinnamon')
  cinnamon.setup(M.opts)
end

return M
