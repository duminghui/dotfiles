local wk = function(lhs, toggle)
  if not LazyVim.has("which-key.nvim") then
    return
  end
  local function safe_get()
    local ok, enabled = pcall(toggle.get)
    if not ok then
      LazyVim.error({ "Failed to get toggle state for **" .. toggle.name .. "**:\n", enabled }, { once = true })
    end
    return enabled
  end
  require("which-key").add({
    {
      lhs,
      icon = function()
        return safe_get() and { icon = "󰔡 ", color = "green" } or { icon = "󰨙 ", color = "yellow" }
      end,
      desc = function()
        return (safe_get() and "Disable " or "Enable ") .. toggle.name
      end,
    },
  })
end

require("lazyvim.util.toggle").wk = wk

local icons = xxx.icons
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
          Error = icons.diagnostic.Error .. " ",
          Warn = icons.diagnostic.Warning .. " ",
          Hint = icons.diagnostic.Hint .. " ",
          Info = icons.diagnostic.Information .. " ",
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
