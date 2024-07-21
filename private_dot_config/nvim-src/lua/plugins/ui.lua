---@type LazySpec
return {
  {
    "rcarriga/nvim-notify",
    opts = {
      icons = {
        DEBUG = xxx.icons.diagnostic.Debug .. " ",
        ERROR = xxx.icons.diagnostic.BoldError .. " ",
        INFO = xxx.icons.diagnostic.BoldInformation .. " ",
        TRACE = xxx.icons.diagnostic.Trace .. " ",
        WARN = xxx.icons.diagnostic.BoldWarning .. " ",
      },
      timeout = 6000,
    },
  },
  { import = "plugins.ui.bufferline" },
  { import = "plugins.ui.lualine" },
  { import = "plugins.ui.ident-blankline" },
  { import = "plugins.ui.noice" },

  { import = "plugins.ui.mini-icons" },

  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      local icon_patchs = {
        [""] = xxx.icons.ui.Search,
        [""] = xxx.icons.ui.File,
        [""] = xxx.icons.ui.Files,
        [""] = xxx.icons.ui.Text,
        [""] = xxx.icons.ui.Gear,
        [""] = xxx.icons.ui.Restore,
        [""] = xxx.icons.misc.Package,
        [""] = xxx.icons.ui.SinOut,
      }
      local config = opts.config
      for _, entity in ipairs(config.center) do
        local icon = vim.trim(entity.icon)
        local icon_patch = icon_patchs[icon]
        if icon_patch then
          entity.icon = string.format("%s ", icon_patch)
        end
      end

      local footer = config.footer
      if type(footer) == "function" then
        footer = footer()
        for idx, entity in ipairs(footer) do
          footer[idx] = string.gsub(entity, "⚡", xxx.icons.kind.Event .. " ")
        end
      end
      config.footer = footer
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    --- require('treesitter-context')
    ---@type TSContext.UserConfig
    opts = {
      mode = "topline", -- cursor, topline
    },
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    event = { "User FileOpened" },
    submodules = false,
  },

  { import = "plugins.ui.tmux" },

  { import = "plugins.ui.fidget" },
}
