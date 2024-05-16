local M = {}

local coms = require('xxx.plugin-config.statusline.lualine-rc.components')

local disabled_filetypes = require('xxx.config.exclude-filetypes').lualine

M.opts = {
  extensions = {
    -- "nvim-tree",
    'neo-tree',
    'overseer',
    -- lazy要在globalstatus为true的情况下才会出现
    -- 'lazy',
  },
  options = {
    theme = 'xxx',
    component_separators = ' ',
    section_separators = { left = ' ', right = '' },
    disabled_filetypes = disabled_filetypes,
    globalstatus = false,
    always_divide_middle = true,
  },

  sections = {
    lualine_a = {
      coms.mode,
    },
    lualine_b = {
      coms.empty,
      coms.filename,
      coms.empty,
      coms.branch,
      coms.diff,
      coms.empty,
      coms.diagnostics,
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      coms.empty,
      coms.overseer,
      coms.empty,
      coms.treesitter,
      coms.empty,
      coms.lsp_clients,
      coms.empty,
      coms.session_status,
      coms.empty,
      coms.file_info,
      coms.empty,
      coms.location,
      coms.progress,
      coms.scrollbar,
    },
  },
  inactive_sections = {
    lualine_a = {
      coms.mode,
    },
    lualine_b = {
      coms.empty,
      coms.filename,
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
}

function M.setup()
  require('lualine').setup(M.opts)
end

return M
