local M = {}

local icons = require('xxx.core.icons')

M.opts = {
  progress = {
    display = {
      done_icon = icons.ui.SquareCheck,
      done_style = 'FidgetDone',
      progress_icon = { pattern = 'dots_negative', period = 1 },
      progress_style = 'FidgetProgress',
      group_style = 'FidgetGroup',
      icon_style = 'FidgetIcon',
      overrides = {
        -- rust_analyzer = {
        --   name = 'Rust Analyzer',
        --   icon = fidget.progress.display.for_icon(fidget.spinner.animate('arrow', 2.5), '🦀'),
        -- update_hook = function(item)
        --   require('fidget.notification').set_content_key(item)
        --   if item.hidden == nil and string.match(item.annote, 'clippy') then
        --     -- Hide clippy-related notifications
        --     item.hidden = true
        --   end
        -- end,
        -- },
      },
    },
  },
  notification = {
    filter = vim.log.levels.DEBUG,
    configs = {
      default = vim.tbl_extend('force', require('fidget.notification').default_config, {
        icon_on_left = true,
      }),
    },
    view = {
      stack_upwards = true,
      icon_separator = ' ',
      group_separator = '--------',
      group_separator_hl = 'FidgetGroupSeparator',
    },
    window = {
      normal_hl = 'FidgetNormal',
      winblend = 0,
      border = 'none',
      border_hl = 'FidgetBorder',
      align = 'bottom',
    },
  },
  logger = {
    level = vim.log.levels.WARN,
  },
}

function M.setup()
  local fidget = require('fidget')
  fidget.setup(M.opts)
end

return M
