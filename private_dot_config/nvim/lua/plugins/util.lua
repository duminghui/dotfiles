---@type LazySpec
return {
  {
    "echasnovski/mini.hipatterns",
    enabled = false,
  },
  {
    -- Highlight hex and rgb colors within Neovim
    "NvChad/nvim-colorizer.lua",
    event = "BufEnter",
    opts = {
      filetypes = { "*", "!mason", "!lazy" },
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = true, -- "Name" codes like Blue or blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = false, -- 0xAARRGGBB hex codes
        mode = "background",
        -- mode = 'foreground',
        -- mode = 'virtualtext',
        always_update = true,
      },
    },
  },

  {
    import = "plugins.util.neovim-session-manager",
  },

  {
    "xvzc/chezmoi.nvim",
    opts = {
      edit = {},
      notification = {
        on_open = true,
        on_apply = true,
        on_watch = false,
      },
    },
  },
}
