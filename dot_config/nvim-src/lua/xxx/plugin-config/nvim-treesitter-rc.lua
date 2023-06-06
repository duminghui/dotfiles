local Log = require('xxx.core.log')
local colors = require('xxx.core.colors').rainbow()

local M = {}

M.opts = {
  parser_install_dir = join_paths(vim.fn.stdpath('data'), 'parsers'),
  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ensure_installed = { 'lua' },
  ensure_installed = {},
  sync_install = false,
  auto_install = false,
  ignore_install = {},
  matchup = {
    enable = false, -- mandatory, false will disable the whole extension
    -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    additional_vim_regex_highlighting = true,
    -- disable = { "latex", "help" },
    disable = function(lang, buf)
      -- disable in big files
      if vim.tbl_contains({ 'latex', 'help' }, lang) then
        return true
      end
      local max_filesize = 1024 * 1024
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        pcall(require('illuminate').pause_buf)
        vim.schedule(function()
          vim.api.nvim_buf_call(buf, function()
            vim.cmd('setlocal noswapfile noundofile')
            if vim.tbl_contains({ 'json' }, lang) then
              vim.cmd('NoMatchParen')
              vim.cmd('syntax off')
              vim.cmd('syntax clear')
              vim.cmd('setlocal nocursorline nolist bufhidden=unload')

              vim.api.nvim_create_autocmd({ 'BufDelete' }, {
                callback = function()
                  vim.cmd('DoMatchParen')
                  vim.cmd('syntax on')
                end,
                buffer = buf,
              })
            end
          end)
        end)
      end
    end,
  },
  incremental_selection = {
    enable = false,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = {
      -- Languages that have a single comment style
      typescript = '// %s',
      css = '/* %s */',
      -- scss = '/* %s */',
      scss = '// %s',
      html = '<!-- %s -->',
      svelte = '<!-- %s -->',
      vue = '<!-- %s -->',
      json = '',
    },
  },
  indent = {
    enable = true,
    -- disable = { "yaml", "python" }
  },
  autotag = { enable = true },
  autopairs = {
    enable = true,
  },
  textobjects = {
    swap = {
      enable = false,
      -- swap_next = textobj_swap_keymaps,
    },
    -- move = textobj_move_keymaps,
    select = {
      enable = true,
      lookahead = true,
      -- keymaps = textobj_sel_keymaps,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ap'] = '@parameter.outer',
        ['ip'] = '@parameter.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.

      -- operator-pending use selection_modes :h operator
      selection_modes = {
        -- ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@function.inner'] = 'V', -- linewise
        -- ['@class.outer'] = '<c-v>', -- blockwise
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']]'] = '@function.outer',
      },
      goto_next_end = {
        [']['] = '@function.outer',
      },
      goto_previous_start = {
        ['[['] = '@function.outer',
      },
      goto_previous_end = {
        ['[]'] = '@function.outer',
      },
    },
  },
  textsubjects = {
    enable = false,
    keymaps = { ['.'] = 'textsubjects-smart', [';'] = 'textsubjects-big' },
  },
  playground = {
    enable = false,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
    colors = {
      colors.c1,
      colors.c2,
      colors.c3,
      colors.c4,
      colors.c5,
      colors.c6,
      colors.c7,
    },
    -- termcolors = {}
  },
}

local function set_rainbow_highlight()
  for i = 1, 7 do
    local c_key = string.format('c%s', i)
    vim.cmd(string.format('highlight rainbowcol%s guifg=%s', i, colors[c_key]))
  end
end

function M.setup()
  -- avoid running in headless mode since it's harder to detect failures
  if #vim.api.nvim_list_uis() == 0 then
    Log:debug('headless mode detected, skipping running setup for treesitter')
    return
  end

  local configs = require('nvim-treesitter.configs')
  -- 这个一定要放在setup前面
  vim.opt.rtp:append(M.opts.parser_install_dir)
  -- vim.opt.rtp:prepend(M.opts.parser_install_dir) -- treesitter needs to be before nvim's runtime in rtp

  -- 在其他方再运行configs.setup() 会影响到自定义安装路径
  configs.setup(M.opts)

  set_rainbow_highlight()

  -- 其他的配置有 autopairs, rainbow, ts-context-commentstring,

  -- 在lsp中配置
  -- set foldmethod=expr
  -- set foldexpr=nvim_treesitter#foldexpr()
end

return M
