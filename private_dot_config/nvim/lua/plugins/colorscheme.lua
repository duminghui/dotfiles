---@type LazySpec
return {
  {
    "folke/tokyonight.nvim",
    enabled = false,
  },
  {
    "svrana/neosolarized.nvim",
    dependencies = {
      "tjdevries/colorbuddy.nvim",
    },
    priority = 1000,
    opts = function()
      local colorbuddy = require("colorbuddy")
      local opts = {
        comment_italics = true,
        -- Transparency by default (disable with background_set = true)
        background_set = false,
        ---@diagnostic disable-next-line: undefined-field
        background_color = colorbuddy.Color.none,
      }
      return opts
    end,
  },
}
