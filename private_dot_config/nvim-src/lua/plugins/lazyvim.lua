local icons = require("xxx.core.icons")
---@type LazySpec
return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "neosolarized",
      -- colorscheme = function()
      -- end,
      icons = {
        misc = {
          dot = icons.ui.Ellipsis,
        },
        ft = {
          octo = icons.misc.Github,
        },
        dap = {
          Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
          Breakpoint = "󰀚 ",
          BreakpointCondition = "󰋗 ",
          BreakpointRejected = { "󰋼 ", "DiagnosticError" },
          LogPoint = ".>",
        },
        diagnostics = {
          Error = icons.diagnostic.BoldError .. " ",
          Warn = icons.diagnostic.BoldWarning .. " ",
          Hint = icons.diagnostic.BoldHint .. " ",
          Info = icons.diagnostic.BoldInformation .. " ",
        },
        git = {
          added = icons.git.BoldLineAdd .. " ",
          modified = icons.git.BoldLineModified .. " ",
          removed = icons.git.BoldLineRemove .. " ", -- 󰛲
        },
        kinds = icons.kinds("  "),
      },
    },
  },
}
