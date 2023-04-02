local M = {}
local version = vim.version()
local ver_str = ""
if version then
  ver_str = string.format("%s.%s.%s", version.major, version.minor, version.patch)
end

local icons = require "xxx.core.icons"

local banner = {
  "",
  "",
  "",
  "Neovim " .. ver_str,
}

function M.get_sections()
  local header = {
    type = "text",
    val = banner,
    opts = {
      position = "center",
      hl = "Label",
    },
  }

  local text = require "xxx.interface.text"

  local footer = {
    type = "text",
    val = text.align_center({ width = 0 }, {
      _VERSION,
    }, 0.5),
    opts = {
      position = "center",
      hl = "Number",
    },
  }

  local buttons = {}

  local status_ok, dashboard = pcall(require, "alpha.themes.dashboard")
  if status_ok then
    local function button(sc, txt, keybind, keybind_opts)
      local b = dashboard.button(sc, txt, keybind, keybind_opts)
      b.opts.hl_shortcut = "Macro"
      return b
    end

    buttons = {
      val = {
        button("n", icons.ui.File .. "  New File", "<CMD>ene!<CR>"),
        button("t", icons.ui.FindText .. "  Find Text", "<CMD>Telescope live_grep<CR>"),
        button("f", icons.ui.FindFile .. "  Find File", "<CMD>Telescope find_files<CR>"),
        button("r", icons.ui.History .. "  Recent files", ":Telescope oldfiles <CR>"),
        button("p", icons.ui.Project .. "  Projects ", "<CMD>Telescope projects<CR>"),
        button("s", icons.ui.Session .. "  Sessions", "<CMD>SessionManager load_session<CR>"),
        button("S", icons.ui.Session2 .. "  Open last session", "<CMD>SessionManager load_last_session<CR>"),
        -- button("s", "ﭯ  Sessions", "<CMD>Telescope persisted<CR>"),
        -- button("S", "  Open last session", ":SessionLoadLast<CR>"),
      },
    }
  end

  return {
    header = header,
    buttons = buttons,
    footer = footer,
  }
end

return M
