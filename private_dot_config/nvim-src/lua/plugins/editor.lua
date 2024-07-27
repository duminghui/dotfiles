local icons = xxx.icons
---@type LazySpec
return {
  { import = "plugins.editor.neo-tree" },
  { import = "plugins.editor.hop" },
  { import = "plugins.editor.which-key" },
  { import = "plugins.editor.telescope" },
  { import = "plugins.editor.trouble" },
  {
    "folke/todo-comments.nvim",
    --- require("todo-comments")
    --- @type TodoOptions
    opts = {
      keywords = {
        FIX = {
          icon = icons.diagnostic.Debug .. " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = icons.ui.CheckBold .. " ", color = "info" },
        HACK = { icon = icons.ui.Fire .. " ", color = "warning" },
        WARN = { icon = icons.diagnostic.Warning .. " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = icons.ui.Clock .. " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = icons.diagnostic.Information .. " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = icons.ui.CameraTimer .. " ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
    },
  },
}
