local M = {}
local version = vim.version()
local ver_str = ''
if version then
  ver_str = string.format('%s.%s.%s', version.major, version.minor, version.patch)
end

local icons = require('xxx.core.icons')

local banner = {
  '',
  '',
  '',
  'Neovim ' .. ver_str,
}

function M.get_sections()
  local header = {
    type = 'text',
    val = banner,
    opts = {
      position = 'center',
      hl = 'Label',
    },
  }

  local text = require('xxx.interface.text')

  local footer = {
    type = 'text',
    val = text.align_center({ width = 0 }, {
      _VERSION,
    }, 0.5),
    opts = {
      position = 'center',
      hl = 'Number',
    },
  }

  local buttons = {
    opts = {
      hl_shortcut = 'Include',
      spacing = 1,
    },
    entries = {
      { 'n', icons.ui.NewFile .. '  New File', '<CMD>ene!<CR>' },
      { 't', icons.ui.FindText .. '  Find Text', '<CMD>Telescope live_grep<CR>' },
      { 'f', icons.ui.FindFile .. '  Find File', '<CMD>Telescope find_files<CR>' },
      { 'r', icons.ui.History .. '  Recent files', ':Telescope oldfiles <CR>' },
      { 'p', icons.ui.Project .. '  Projects ', '<CMD>Telescope projects<CR>' },
      { 's', icons.ui.Session .. '  Sessions', '<CMD>SessionManager load_session<CR>' },
      { 'S', icons.ui.Session2 .. '  Open last session', '<CMD>SessionManager load_last_session<CR>' },
      { 'q', icons.ui.Close .. '  Quit', '<CMD>quit<CR>' },
    },
  }

  -- local status_ok, dashboard = pcall(require, 'alpha.themes.dashboard')
  -- if status_ok then
  --   local function button(sc, txt, keybind, keybind_opts)
  --     local b = dashboard.button(sc, txt, keybind, keybind_opts)
  --     b.opts.hl_shortcut = 'Macro'
  --     return b
  --   end

  --   buttons = {
  --     val = {
  --       -- button("s", "ﭯ  Sessions", "<CMD>Telescope persisted<CR>"),
  --       -- button("S", "  Open last session", ":SessionLoadLast<CR>"),
  --     },
  --   }
  -- end

  return {
    header = header,
    buttons = buttons,
    footer = footer,
  }
end

return M
