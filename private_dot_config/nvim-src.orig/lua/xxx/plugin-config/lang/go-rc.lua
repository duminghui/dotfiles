local M = {}

local log_path = join_paths(vim.fn.stdpath('log'), 'gonvim.log')
local lsp = require('xxx.lsp')

-- https://github.com/ray-x/go.nvim/blob/master/lua/go.lua
M.opts = {
  disable_defaults = false, -- true|false when true disable all default settings, user need to set all settings
  go = 'go', -- set to go1.18beta1 if necessary
  goimports = 'gopls', -- if set to 'gopls' will use gopls format, also goimport
  fillstruct = 'gopls',
  -- gofumpt: import部分不会分组, 最终使用的是golines
  -- gofmt = "gofumpt", -- if set to gopls will use gopls format
  -- 使用gopls最终使用的是vim.lsp.buf.format({name=gopls}), import部分分组是下面配置项lsp_gofumpt=true
  gofmt = 'gopls', -- if set to gopls will use gopls format
  -- max_line_len = 128,
  max_line_len = 0,
  tag_transform = false,
  tag_options = 'json=omitempty',
  test_dir = '',
  comment_placeholder = '   ',
  icons = { breakpoint = '🧘', currentpos = '🏃' }, -- set to false to disable icons setup
  sign_priority = 11, -- set priority of signs used by go.nevim
  verbose = true,
  log_path = log_path,
  lsp_cfg = {
    capabilities = lsp.common_capabilities(),
    settings = {
      gopls = {
        analyses = {
          -- ST1003: should not use underscores in package name
          ST1003 = false,
        },
      },
    },
  }, -- false: do nothing
  -- true: apply non-default gopls setup defined in go/lsp.lua
  -- if lsp_cfg is a table, merge table with with non-default gopls setup in go/lsp.lua, e.g.
  lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt, true: import部分分组, false: 不分组
  lsp_on_attach = nil, -- nil: use on_attach function defined in go/lsp.lua for gopls,
  --      when lsp_cfg is true
  -- if lsp_on_attach is a function: use this function as on_attach function for gopls,
  --                                 when lsp_cfg is true
  lsp_on_client_start = function(client, bufnr)
    require('xxx.lsp.keymappings').add_lsp_buffer_keybindings(client, bufnr)
    local lu = require('xxx.lsp.utils')
    lu.setup_document_highlight(client, bufnr)
    -- lu.setup_format_on_save(client, bufnr, function()
    --   require("go.format").goimport()
    -- end)
    lu.setup_format_on_save(client, bufnr)
    lu.setup_fold()
    lsp.add_lsp_buffer_options(bufnr)
  end, -- it is a function with same signature as on_attach, will be called at end of

  lsp_document_formatting = true,
  -- set to true: use gopls to format
  -- false if you want to use other formatter tool(e.g. efm, nulls)

  -- on_attach and allows you override some setup
  null_ls_document_formatting_disable = false, -- true: disable null-ls formatting
  -- if enable gopls to format the code and you also instlled and enabled null-ls, you may
  -- want to disable null-ls by setting this to true
  -- it can be a nulls source name e.g. `golines` or a nulls query table
  lsp_keymaps = true, -- set to false to disable gopls/lsp keymap
  lsp_codelens = true, -- set to false to disable codelens, true by default, you can use a function
  -- function(bufnr)
  --    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap=true, silent=true})
  -- end
  -- to setup a table of codelens
  diagnostic = { -- set diagnostic to false to disable vim.diagnostic setup
    -- in go.nvim
    hdlr = false, -- hook lsp diag handler and send diag to quickfix
    underline = true,
    -- virtual text setup
    -- virtual_text = { space = 0, prefix = '󰄛' },
    virtual_text = { spacing = 0, prefix = '■' },
    signs = true,
    update_in_insert = false,
  },
  -- if you need to setup your ui for input and select, you can do it here
  -- go_input = require('guihua.input').input -- set to vim.ui.input to disable guihua input
  -- go_select = require('guihua.select').select -- vim.ui.select to disable guihua select
  lsp_inlay_hints = {
    enable = true,
    -- Only show inlay hints for the current line
    only_current_line = false,
    -- Event which triggers a refersh of the inlay hints.
    -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
    -- not that this may cause higher CPU usage.
    -- This option is only respected when only_current_line and
    -- autoSetHints both are true.
    only_current_line_autocmd = 'CursorHold',
    -- whether to show variable name before type hints with the inlay hints or not
    -- default: false
    show_variable_name = true,
    -- prefix for parameter hints
    parameter_hints_prefix = '󰊕 ',
    show_parameter_hints = true,
    -- prefix for all the other hints (type, chaining)
    -- default: "=>"
    other_hints_prefix = '=> ',
    -- whether to align to the lenght of the longest line in the file **
    max_len_align = true,
    -- padding from the left if max_len_align is true
    max_len_align_padding = 1,
    -- whether to align to the extreme right or not **
    right_align = false,
    -- padding from the right if right_align is true
    right_align_padding = 6,
    -- The color of the hints
    highlight = 'Comment',
  },
  lsp_diag_update_in_insert = false,
  lsp_fmt_async = false, -- async lsp.buf.format, but will lose save ??
  go_boilplater_url = 'https://github.com/thockin/go-build-template.git',
  gopls_cmd = nil, --- you can provide gopls path and cmd if it not in PATH, e.g. cmd = {  "/home/ray/.local/nvim/data/lspinstall/go/gopls" }
  gopls_remote_auto = true,
  gocoverage_sign = '█',
  gocoverage_skip_covered = false,
  sign_covered_hl = 'String', --- highlight group for test covered sign, you can either
  sign_uncovered_hl = 'Error', -- highlight group for uncovered code
  launch_json = nil, -- the launch.json file path, default to .vscode/launch.json
  -- launch_json = vfn.getcwd() .. "/.vscode/launch.json",
  dap_debug = true,
  dap_debug_gui = true,
  dap_debug_keymap = true, -- true: use keymap for debugger defined in go/dap.lua
  -- false: do not use keymap in go/dap.lua.  you must define your own.
  dap_debug_vt = true, -- false, true and 'all frames'
  dap_port = 38697, -- can be set to a number or `-1` so go.nvim will pickup a random port
  dap_timeout = 15, --  see dap option initialize_timeout_sec = 15,
  dap_retries = 20, -- see dap option max_retries
  build_tags = '', --- you can provide extra build tags for tests or debugger
  textobjects = false, -- treesitter binding for text objects **, 启用会影响到treesitter的自定义安装路径
  test_runner = 'go', -- one of {`go`, `richgo`, `dlv`, `ginkgo`, `gotestsum`}
  verbose_tests = true, -- set to add verbose flag to tests
  run_in_floaterm = false, -- set to true to run in float window.
  floaterm = {
    posititon = 'auto', -- one of {`top`, `bottom`, `left`, `right`, `center`, `auto`}
    width = 0.45, -- width of float window if not auto
    height = 0.98, -- height of float window if not auto
    title_colors = 'nord', -- table of colors for title, or a color scheme name
  },
  trouble = true, -- true: use trouble to open quickfix **
  test_efm = false, -- errorfomat for quickfix, default mix mode, set to true will be efm only

  luasnip = true, -- enable included luasnip **
  username = '',
  useremail = '',
  disable_per_project_cfg = false, -- set to true to disable load script from .gonvim/init.lua
  on_jobstart = function(cmd)
    _ = cmd
  end, -- callback for stdout
  on_stdout = function(err, data)
    _, _ = err, data
  end, -- callback when job started
  on_stderr = function(err, data)
    _, _ = err, data
  end, -- callback for stderr
  on_exit = function(code, signal, output)
    _, _, _ = code, signal, output
  end, -- callback for jobexit, output : string
  iferr_vertical_shift = 4, -- defines where the cursor will end up vertically from the begining of if err statement after GoIfErr command
}

function M.setup()
  local go = require('go')
  go.setup(M.opts)
end

return M
