local M = {}

local xxx_dashboard = require('xxx.plugin-config.alpha-rc.dashboard')
local xxx_startify = require('xxx.plugin-config.alpha-rc.startify')

M.opts = {
  dashboard = {
    config = {},
    section = xxx_dashboard.get_sections(),
    opts = { autostart = true },
  },
  startify = {
    config = {},
    section = xxx_startify.get_sections(),
    opts = { autostart = true },
  },
  mode = 'dashboard',
  -- mode = "startify",
}

local function resolve_buttons(theme_name, button_section)
  if button_section.val and #button_section.value > 0 then
    return button_section.val
  end
  local selected_theme = require('alpha.themes.' .. theme_name)
  local val = {}
  for _, entry in pairs(button_section.entries) do
    local on_press = function()
      local sc_ = entry[1]:gsub('%s', ''):gsub('SPC', '<leader>')
      local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
      vim.api.nvim_feedkeys(key, 'normal', false)
    end
    local button_element = selected_theme.button(entry[1], entry[2], entry[3])
    -- this became necessary after recent changes in alpha.nvim (06ade3a20ca9e79a7038b98d05a23d7b6c016174)
    button_element.on_press = on_press
    table.insert(val, button_element)
  end
  return val
end

local function resolve_config(theme_name)
  local selected_theme = require('alpha.themes.' .. theme_name)
  local resolved_section = selected_theme.section
  local section = M.opts[theme_name].section

  for name, el in pairs(section) do
    for k, v in pairs(el) do
      if name:match('buttons') and k == 'entries' then
        resolved_section[name].val = resolve_buttons(theme_name, el)
      elseif v then
        resolved_section[name][k] = v
      end
    end
    resolved_section[name].opts = el.opts or {}
  end

  local opts = M.opts[theme_name].opts or {}
  selected_theme.config.opts = vim.tbl_extend('force', selected_theme.config.opts, opts)

  return selected_theme.config
end

-- local function configure_additional_autocmds()
-- local group = '_dashboard_settings'
-- vim.api.nvim_create_augroup(group, {})
-- vim.api.nvim_create_autocmd('FileType', {
--   group = group,
--   pattern = 'alpha',
--   command = 'set showtabline=0 | autocmd BufLeave <buffer> set showtabline=' .. vim.opt.showtabline._value,
-- })
-- local lualine_opts = require("xxx.plugin-config.lualine").opts
-- if not lualine_opts.options.globalstatus then
--     -- https://github.com/goolord/alpha-nvim/issues/42
--     vim.api.nvim_create_autocmd("FileType", {
--         group = group,
--         pattern = "alpha",
--         command = "set laststatus=0 | autocmd BufUnload <buffer> set laststatus=" .. vim.opt.laststatus._value,
--     })
-- end
-- end

function M.setup()
  local alpha = require('alpha')

  local mode = M.opts.mode
  local config = M.opts[mode].config
  if vim.tbl_isempty(config) then
    config = resolve_config(mode)
  end
  alpha.setup(config)
  -- configure_additional_autocmds()
end

return M
