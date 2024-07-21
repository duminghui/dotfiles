local icons = require("xxx.core.icons")

local function fix_highlight(name, fg, bg)
  local hl = {}
  hl[name] = { fg = fg, bg = bg }
  hl[name .. "_visible"] = { fg = fg }
  hl[name .. "_selected"] = { fg = fg }
  return hl
end

local function highlights()
  local colors = require("xxx.core.colors").universal()
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
    fill = { bg = tag_fg },
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

  local modified_hl = fix_highlight("modified", c_modified, tag_bg)
  local duplicate_hl = fix_highlight("duplicate", c_duplicate, tag_bg)
  local separator_hl = fix_highlight("separator", tag_fg, tag_bg)
  local pick_hl = fix_highlight("pick", c_pick, tag_bg)

  hl = vim.tbl_deep_extend("force", hl, modified_hl, duplicate_hl, separator_hl, pick_hl)

  -- fix diagnostic highlight
  local diagnostic_names = { "hint", "info", "warning", "error" }
  for _, name in ipairs(diagnostic_names) do
    -- text
    hl[name] = { bg = tag_bg }
    local diagnostic_name = name .. "_diagnostic"
    hl[diagnostic_name] = { bg = tag_bg }
  end

  return hl
end

local function diagnostics_indicator(_, _, diagnostics, _)
  local result = {}
  local types = { "error", "warning", "info" }
  local symbols = {
    error = icons.diagnostic.BoldError,
    warning = icons.diagnostic.BoldWarning,
    info = icons.diagnostic.BoldInformation,
  }

  for _, type in ipairs(types) do
    local count = diagnostics[type]
    if count and count > 0 then
      local count_str = tostring(count)
      if count > 9 then
        count_str = "9+"
      end
      table.insert(result, symbols[type] .. " " .. count_str)
    end
  end
  return #result > 0 and table.concat(result, " ") or ""
end

local function custom_filter(bufnr)
  -- Bufferline can be configured to take a custom filtering function via the
  -- `custom_filter` option. This value must be a lua function that will receive
  -- each buffer number that is going to be used for the bufferline, as well as all the others.
  -- A user can then check whatever they would like and return `true` if they would like it to
  -- appear and `false` if not.

  -- filter out filetypes you don't want to see
  local exclude_ft = { "qf", "fugitive", "git", "dirvish" }
  local cur_ft = vim.bo[bufnr].filetype
  local should_show = not vim.tbl_contains(exclude_ft, cur_ft)

  if vim.t.bufferline_tab_filter_enabled and not vim.tbl_contains(vim.fn.tabpagebuflist(), bufnr) then
    should_show = should_show and vim.t.bufferline_show_buffers and vim.t.bufferline_show_buffers[tostring(bufnr)]
  end

  return should_show
end

local M = {}

---@param _ LazyPlugin
---@param opts bufferline.UserConfig
M.opts = function(_, opts)
  -- vim.print(plugin._.handlers.event)
  opts = opts or {}

  local opts_new = {
    options = {
      buffer_close_icon = icons.ui.Close,
      modified_icon = icons.ui.PrimitiveDot,
      close_icon = icons.ui.BoldClose,
      left_trunc_marker = icons.ui.ArrowCircleLeft,
      right_trunc_marker = icons.ui.ArrowCircleRight,
      max_name_length = 12,
      max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      truncate_names = false, -- whether or not tab names should be truncated
      tab_size = 15,
      diagnostics_indicator = diagnostics_indicator,
      custom_filter = custom_filter,
      offsets = {
        {
          filetype = "undotree",
          text = "Undotree",
          highlight = "PanelHeading",
          padding = 1,
        },
        {
          filetype = "NvimTree",
          text = "Explorer",
          highlight = "PanelHeading",
          padding = 1,
          -- separator = "┃",
        },
        {
          filetype = "neo-tree",
          text = "Neo-Tree Explorer",
          highlight = "PanelHeading",
          padding = 1,
          -- separator = "┃",
        },
        {
          filetype = "DiffviewFiles",
          text = "Diff View",
          highlight = "PanelHeading",
          padding = 1,
        },
        {
          filetype = "flutterToolsOutline",
          text = "Flutter Outline",
          highlight = "PanelHeading",
        },
        {
          filetype = "packer",
          text = "Packer",
          highlight = "PanelHeading",
          padding = 1,
        },
      },
      show_buffer_close_icons = true,
      show_close_icon = true,
      separator_style = "slant", -- "slant" | "slope" | "thick" | "thin" | "padded_slant" | { "any", "any" },
      always_show_bufferline = true,
      hover = {
        enabled = true, -- requires nvim 0.8+
        delay = 200,
        reveal = { "close" },
      },
      custom_areas = {
        right = function()
          local colors = require("xxx.core.colors").universal()
          local result = {}
          if vim.t.bufferline_tab_filter_enabled then
            table.insert(result, { text = icons.ui.Filter .. " ", fg = colors.cyan })
          end
          return result
        end,
      },
      groups = {
        items = {
          require("bufferline.groups").builtin.pinned:with({ icon = "󰐃" }),
        },
      },
    },
    highlights = highlights(),
  }

  return vim.tbl_deep_extend("force", opts, opts_new)
end

return {
  "akinsho/bufferline.nvim",
  opts = M.opts,
  event = function()
    return { "User FileOpened" }
  end,
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
    { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete Other Buffers" },
    { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
    { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
    { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
    -- disable
    { "<S-h>", false },
    { "<S-l>", false },
    -- add new
    { "<leader>bj", "<Cmd>BufferLinePick<CR>", desc = "Pick Buffer" },
    { "<leader>bc", "<Cmd>BufferLinePickClose<CR>", desc = "Pick Close Buffer" },
  },
}
