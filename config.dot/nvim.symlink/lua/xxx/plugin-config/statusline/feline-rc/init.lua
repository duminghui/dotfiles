local M = {}

M.force_inactive = {
  filetypes = {
    "^alpha$",
    "^frecency$",
    "^packer$",
    "^TelescopePrompt$",
    "^undotree$",
  },
}

M.disable = {
  filetypes = {
    "^alpha$",
    "^dap-repl$",
    "^dapui_scopes$",
    "^dapui_stacks$",
    "^dapui_breakpoints$",
    "^dapui_watches$",
    "^DressingInput$",
    "^DressingSelect$",
    "^floaterm$",
    "^minimap$",
    "^qfs$",
    "^tsplayground$",
  },
}


local function opts_with_empty_components()
  local colors = require("xxx.plugin-config.colorscheme.colors").colors()
  local opts = {
    -- theme = {
    --     fg = "NONE",
    --     bg = "NONE",
    -- },
    disable = M.disable,
    force_inactive = M.force_inactive,
    -- components = {
    --     active = {},
    --     inactive = { { { provider = "" } } },
    -- },
    vi_mode_colors = {
      NORMAL = colors.purple,
      OP = colors.purple,
      INSERT = colors.green,
      VISUAL = colors.orange,
      LINES = colors.orange,
      BLOCK = colors.orange,
      REPLACE = colors.green,
      ["V-REPLACE"] = colors.green,
      ENTER = colors.cyan,
      MORE = colors.cyan,
      SELECT = colors.orange,
      COMMAND = colors.purple,
      SHELL = colors.purple,
      TERM = colors.purple,
      NONE = colors.yellow,

    }
  }
  return opts
end

function M.setup()
  local ok, feline = safe_require("feline")
  if not ok then
    return
  end

  -- local opts, winbar_opts = M.opts()
  local opts = opts_with_empty_components()
  -- opts.components = statusline_components()
  local coms = require("xxx.plugin-config.statusline.feline-rc.components")
  coms.init()

  local components = {
    active = {
      {
        coms.vi_mode,
        coms.file_info,
        coms.git,
        coms.lsp_diagnostics,
        -- coms.filler,
      },
      {
        coms.overseer,
        coms.treesitter,
        coms.lsp_info,
        coms.sessions,
        -- coms.space,
        -- coms.file_encoding,
        -- coms.file_format,
        -- coms.file_type,
        coms.file_detail,
        coms.position,
        coms.line_percentage,
        coms.scroll_bar,
      }
    },
    inactive = { {}, {} },
  }

  local setup_opts = vim.tbl_deep_extend("force", opts, {
    components = components,
  })
  feline.setup(setup_opts)

  -- local winbar_opts = {
  --     components = winbar_components()
  -- }
  -- feline.winbar.setup(winbar_opts)

  -- statusbar demo
  -- require("xxx.plugin-config.statusline.demo").init()

end

return M
