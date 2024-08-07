-- local navic = require('nvim-navic')
local icons = require('xxx.core.icons')
local colors = require('xxx.core.colors').universal()

local M = {}

local function fix_highlight(name, fg, bg)
  local hl = {}
  hl[name] = { fg = fg, bg = bg }
  hl[name .. '_visible'] = { fg = fg }
  hl[name .. '_selected'] = { fg = fg }
  return hl
end

local function highlights()
  local tag_fg = colors.bufferline.tag_fg
  local tag_bg = colors.bufferline.tag_bg
  local text_fg = colors.bufferline.text
  local text_selected = colors.bufferline.text_selected
  local c_modified = colors.bufferline.modified
  local c_duplicate = colors.blue
  local c_pick = colors.bufferline.pick

  -- visible代表的意思是指如果焦点正在一个buffer上, 然后跳转到其他的window, 这个buffer就是visible的状态
  ------------------- 所有highlight属性
  -- fill
  -- background 不在visible和selected状态下标签标的highlight
  -- tab{,selected,close}
  -- close_button{,visible,selected}
  -- buffer(visible,selected)
  -- numbers{,visible,selected}
  -- diagnostic{,visible,selected} -- 这个不知道在哪里起作用
  -- hint{,visible,selected} hint_diagnostic{,visible,selected}
  -- info{,visible,selected} info_diagnostic{,visible,selected}
  -- warning{,visible,selected} warning_diagnostic{,visible,selected}
  -- error{,visible,selected} error_diagnostic{,visible,selected}
  -- modified{,visible,selected}
  -- duplicate{,visible,selected}
  -- separator{,visible,selected}
  -- indicator_selected
  -- pick{,visible,selected}
  -- offset_separator
  -------------------
  local hl = {
    fill = {
      bg = tag_fg,
    },
    -- buffer 标签栏,不在visible和selected状态下
    background = {
      fg = text_fg, -- text color
      bg = tag_bg,
    },
    tab = {
      fg = text_fg,
      bg = tag_bg,
    },
    tab_selected = {
      fg = colors.darkgold,
      bold = true,
    },
    tab_close = {
      fg = colors.red,
    },
    buffer_visible = {
      fg = text_selected,
      bold = true,
      -- italic = true,
    },
    buffer_selected = {
      fg = text_selected,
      bold = true,
      italic = true,
    },
    tab_separator = {
      fg = tag_fg,
      bg = tag_bg,
    },
    tab_separator_selected = {
      fg = tag_fg,
    },
    trunc_marker = {
      fg = text_selected,
      bg = tag_fg,
    },
  }

  local modified_hl = fix_highlight('modified', c_modified, tag_bg)
  local duplicate_hl = fix_highlight('duplicate', c_duplicate, tag_bg)
  local separator_hl = fix_highlight('separator', tag_fg, tag_bg)
  local pick_hl = fix_highlight('pick', c_pick, tag_bg)

  hl = vim.tbl_deep_extend('force', hl, modified_hl, duplicate_hl, separator_hl, pick_hl)

  -- fix diagnostic highlight
  local diagnostic_names = { 'hint', 'info', 'warning', 'error' }
  for _, name in ipairs(diagnostic_names) do
    -- text
    hl[name] = { bg = tag_bg }
    local diagnostic_name = name .. '_diagnostic'
    hl[diagnostic_name] = { bg = tag_bg }
  end

  return hl
end

local function diagnostics_indicator(_, _, diagnostics, _)
  local result = {}
  local types = { 'error', 'warning', 'info' }
  local symbols = {
    error = icons.diagnostics.BoldError,
    warning = icons.diagnostics.BoldWarning,
    info = icons.diagnostics.BoldInformation,
  }

  for _, type in ipairs(types) do
    local count = diagnostics[type]
    if count and count > 0 then
      local count_str = tostring(count)
      if count > 9 then
        count_str = '9+'
      end
      table.insert(result, symbols[type] .. ' ' .. count_str)
    end
  end
  return #result > 0 and table.concat(result, ' ') or ''
end

-- local function is_ft(b, ft)
--   return vim.bo[b].filetype == ft
-- end

-- local function custom_filter(buf, buf_nums)
--   local is_log = is_ft(buf, 'log')
--   local logs = vim.tbl_filter(function(b)
--     return is_ft(b, 'log')
--   end, buf_nums)
--   if vim.tbl_isempty(logs) then
--     return true
--   end
--   local tab_num = vim.fn.tabpagenr()
--   local last_tab = vim.fn.tabpagenr('$')
--   if last_tab == 1 then
--     return true
--   end
--   -- only show log buffers in secondary tabs
--   return (tab_num == last_tab and is_log) or (tab_num ~= last_tab and not is_log)
-- end

local function custom_filter(bufnr)
  -- if the result is false, this buffer will be shown, otherwise, this
  -- buffer will be hidden.

  -- filter out filetypes you don't want to see
  local exclude_ft = { 'qf', 'fugitive', 'git', 'dirvish' }
  local cur_ft = vim.bo[bufnr].filetype
  local should_show = not vim.tbl_contains(exclude_ft, cur_ft)

  if vim.t.bufferline_tab_filter_enabled and not vim.tbl_contains(vim.fn.tabpagebuflist(), bufnr) then
    should_show = should_show and vim.t.bufferline_show_buffers and vim.t.bufferline_show_buffers[tostring(bufnr)]
  end

  return should_show
end

function M.tab_filter_buf_toggle()
  vim.t.bufferline_tab_filter_enabled = not vim.t.bufferline_tab_filter_enabled
  vim.cmd([[redraw!]])
end

function M.tab_filter_buf_add()
  local new_value = vim.t.bufferline_show_buffers or {}
  new_value[tostring(vim.fn.bufnr())] = true
  vim.t.bufferline_show_buffers = new_value
  vim.cmd([[redraw!]])
end

function M.tab_filter_buf_remove()
  if vim.t.bufferline_show_buffers ~= nil then
    local new_value = vim.t.bufferline_show_buffers
    new_value[tostring(vim.fn.bufnr())] = nil
    if next(new_value) == nil then
      vim.t.bufferline_show_buffers = nil
    else
      vim.t.bufferline_show_buffers = new_value
    end
    vim.cmd([[redraw!]])
  end
end

M.opts = {
  -- keymap = {
  --     normal_mode = {},
  -- },
  options = {
    mode = 'buffers', -- set to "tabs" to only show tabpages instead
    -- numbers = 'none', -- can be "none" | "ordinal" | "buffer_id" | "both" | function
    -- numbers = function(opts)
    --     return string.format('%s', opts.raise(opts.id))
    -- end,

    close_command = 'bdelete! %d', -- can be a string | function, see "Mouse actions"
    right_mouse_command = 'vert sbuffer %d', -- can be a string | function, see "Mouse actions"
    left_mouse_command = 'buffer %d', -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
    -- indicator = {
    --   icon = '▎', -- this should be omitted if indicator style is not 'icon'
    --   style = 'icon', -- 'icon' | 'underline' | 'none',
    -- },
    -- indicator = "",
    buffer_close_icon = icons.ui.Close,
    modified_icon = icons.ui.PrimitiveDot,
    close_icon = icons.ui.BoldClose,
    left_trunc_marker = icons.ui.ArrowCircleLeft,
    right_trunc_marker = icons.ui.ArrowCircleRight,
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
      -- remove extension from markdown files for example
      if buf.name:match('%.md') then
        return vim.fn.fnamemodify(buf.name, ':t:r')
      end
    end,
    max_name_length = 12,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    truncate_names = false, -- whether or not tab names should be truncated
    tab_size = 15,
    diagnostics = 'nvim_lsp',
    diagnostics_update_in_insert = false,
    diagnostics_indicator = diagnostics_indicator,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    custom_filter = custom_filter,
    offsets = {
      {
        filetype = 'undotree',
        text = 'Undotree',
        highlight = 'PanelHeading',
        padding = 1,
      },
      {
        filetype = 'NvimTree',
        text = 'Explorer',
        highlight = 'PanelHeading',
        padding = 1,
        -- separator = "┃",
      },
      {
        filetype = 'neo-tree',
        text = 'Explorer',
        highlight = 'PanelHeading',
        padding = 1,
        -- separator = "┃",
      },
      {
        filetype = 'DiffviewFiles',
        text = 'Diff View',
        highlight = 'PanelHeading',
        padding = 1,
      },
      {
        filetype = 'flutterToolsOutline',
        text = 'Flutter Outline',
        highlight = 'PanelHeading',
      },
      {
        filetype = 'packer',
        text = 'Packer',
        highlight = 'PanelHeading',
        padding = 1,
      },
    },
    color_icons = true, -- whether or not to add the filetype icon highlights
    -- get_element_icon = function(buf)
    --   local file_name = vim.fn.fnamemodify(buf.path, ':t')
    --   return require('nvim-web-devicons').get_icon(file_name, buf.extension, { default = true })
    -- end,
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = true,
    show_close_icon = false,
    show_tab_indicators = true,
    show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
    -- persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = 'slant', -- "slant" | "slope" | "thick" | "thin" | "padded_slant" | { "any", "any" },
    -- enforce_regular_tabs = false,
    always_show_bufferline = true,
    hover = {
      enabled = true, -- requires nvim 0.8+
      delay = 200,
      reveal = { 'close' },
    },
    custom_areas = {
      right = function()
        local result = {}
        if vim.t.bufferline_tab_filter_enabled then
          table.insert(result, { text = icons.ui.Filter .. ' ', fg = colors.cyan })
        end
        return result
      end,
    },
    groups = {
      items = {
        require('bufferline.groups').builtin.pinned:with { icon = '󰐃' },
      },
    },
  },
  highlights = highlights(),
}

function M.setup()
  local bufferline = require('bufferline')
  bufferline.setup(M.opts)
end

return M
