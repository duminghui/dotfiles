local M = {}
M.opts = {
  -- filter = function(mapping)
  --   return true
  -- end,
  spec = {
    {
      { "<leader><leader>", group = "Hop" },
      { "<leader>w", group = "Save File" },
    },
  },
  --- require("which-key") fix wk.Win fix wk.Win Undefined type or alias `wk.Win.opts`
  ---@type wk.Win.opts
  win = {
    height = { min = 3, max = 28 },
    wo = {
      winblend = 7,
    },
    padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
    no_overlap = true,
  },
  layout = {
    width = { min = 36, max = 50 }, -- min and max width of the columns
  },
  icons = {
    separator = "󱦰 ", -- 󰁔
    --- See `lua/which-key/icons.lua` for more details
    --- Set to `false` to disable keymap icons
    ---@type wk.IconRule[]|false
    rules = {
      --- whick-key default
      { plugin = "fzf-lua", cat = "filetype", name = "fzf" },
      { plugin = "neo-tree.nvim", cat = "filetype", name = "neo-tree" },
      { plugin = "octo.nvim", cat = "filetype", name = "git" },
      { plugin = "yanky.nvim", icon = "󰅇", color = "yellow" },
      { plugin = "zen-mode.nvim", icon = "󱅻 ", color = "cyan" },
      { plugin = "telescope.nvim", pattern = "telescope", icon = "", color = "blue" },
      { plugin = "trouble.nvim", cat = "filetype", name = "trouble" },
      { plugin = "todo-comments.nvim", cat = "file", name = "TODO" },
      { plugin = "nvim-spectre", icon = "󰛔 ", color = "blue" },
      { plugin = "noice.nvim", pattern = "noice", icon = "󰈸", color = "orange" },
      -- { plugin = "persistence.nvim", icon = " ", color = "azure" },
      { plugin = "persistence.nvim", icon = "󰉉 ", color = "azure" },
      { plugin = "neotest", cat = "filetype", name = "neotest-summary" },
      { plugin = "lazy.nvim", cat = "filetype", name = "lazy" },
      { plugin = "CopilotChat.nvim", icon = " ", color = "orange" },
      { pattern = "git", cat = "filetype", name = "git" },
      { pattern = "terminal", icon = " ", color = "red" },
      -- { pattern = "find", icon = " ", color = "green" },
      -- { pattern = "search", icon = " ", color = "green" },
      { pattern = "find", icon = "󰍉 ", color = "green" },
      { pattern = "search", icon = "󰍉 ", color = "green" },
      { pattern = "test", cat = "filetype", name = "neotest-summary" },
      { pattern = "lazy", cat = "filetype", name = "lazy" },
      { pattern = "buffer", icon = "󰈔", color = "cyan" },
      { pattern = "file", icon = "󰈔", color = "cyan" },
      -- { pattern = "window", icon = " ", color = "blue" },
      { pattern = "window", icon = "󰖯 ", color = "blue" },
      { pattern = "diagnostic", icon = "󱖫 ", color = "green" },
      -- { pattern = "format", icon = " ", color = "cyan" },
      { pattern = "format", icon = "󰉢 ", color = "cyan" },
      { pattern = "debug", icon = "󰃤 ", color = "red" },
      -- { pattern = "code", icon = " ", color = "orange" },
      { pattern = "code", icon = "󰗀 ", color = "orange" },
      { pattern = "notif", icon = "󰵅 ", color = "blue" },
      -- { pattern = "toggle", icon = " ", color = "yellow" },
      { pattern = "toggle", icon = "󰔡 ", color = "yellow" },
      -- { pattern = "session", icon = " ", color = "azure" },
      { pattern = "session", icon = "󰉉 ", color = "azure" },
      { pattern = "exit", icon = "󰿅 ", color = "red" }, --󰿅 󰈆 󰍃 󰍂
      { pattern = "quit", icon = "󰿅 ", color = "red" },
      { pattern = "tab", icon = "󰓩 ", color = "purple" },
      -- { pattern = "ai", icon = " ", color = "green" },
      { pattern = "ai", icon = "󱚝 ", color = "green" },
      { pattern = "ui", icon = "󰙵 ", color = "cyan" },
      --- custom
      { plugin = "neovim-session-manager", icon = "󰉉 ", color = "azure" },
      { pattern = "lowercase", icon = "󰬵" },
      { pattern = "uppercase", icon = "󰬶" },
      { pattern = "hop", icon = "󰍎", color = "green" },
    },
    keys = {
      Up = "󰜷 ",
      Down = "󰜮 ",
      Left = "󰜱 ",
      Right = "󰜴 ",
      C = "󰘴 ",
      M = "󰘵 ",
      S = "󰘶 ",
      CR = "󰌑 ",
      Esc = "󱊷 ",
      ScrollWheelDown = "󱕐 ",
      ScrollWheelUp = "󱕑 ",
      NL = "󰌑 ",
      BS = "󰁮",
      Space = "󱁐 ",
      Tab = "󰌒 ",
      F1 = "󱊫",
      F2 = "󱊬",
      F3 = "󱊭",
      F4 = "󱊮",
      F5 = "󱊯",
      F6 = "󱊰",
      F7 = "󱊱",
      F8 = "󱊲",
      F9 = "󱊳",
      F10 = "󱊴",
      F11 = "󱊵",
      F12 = "󱊶",
    },
  },
}
---@type LazySpec
return {
  "folke/which-key.nvim",
  -- opts_extend = { "spec" },
  -- opts_extend = {},
  opts = M.opts,
}
