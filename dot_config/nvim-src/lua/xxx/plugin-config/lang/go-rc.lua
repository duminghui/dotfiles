local M = {}

local log_path = join_paths(vim.fn.stdpath("log"), "gonvim.log")
local lsp = require("xxx.lsp")

M.opts = {
  disable_defaults = false, -- either true when true disable all default settings
  go = "go",                -- set to go1.18beta1 if necessary
  goimport = "gopls",       -- if set to 'gopls' will use gopls format, also goimport
  fillstruct = "gopls",
  -- gofumpt: import部分不会分组, 最终使用的是golines
  -- gofmt = "gofumpt", -- if set to gopls will use gopls format
  -- 使用gopls最终使用的是vim.lsp.buf.format({name=gopls}), import部分分组是下面配置项lsp_gofumpt=true
  gofmt = "gopls", -- if set to gopls will use gopls format
  max_line_len = 128,
  tag_transform = false,
  gotests_template = "",     -- sets gotests -template parameter (check gotests for details)
  gotests_template_dir = "", -- sets gotests -template_dir parameter (check gotests for details)
  comment_placeholder = "   ",
  icons = { breakpoint = "🧘", currentpos = "🏃" }, -- set to false to disable icons setup
  sign_priority = 11,                             -- set priority of signs used by go.nevim
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
  lsp_gofumpt = true,  -- true: set default gofmt in gopls format to gofumpt, true: import部分分组, false: 不分组
  lsp_on_attach = nil, -- nil: use on_attach function defined in go/lsp.lua for gopls,
  --      when lsp_cfg is true
  -- if lsp_on_attach is a function: use this function as on_attach function for gopls,
  --                                 when lsp_cfg is true
  lsp_on_client_start = function(client, bufnr)
    require "xxx.lsp.keymappings".add_lsp_buffer_keybindings(client, bufnr)
    local lu = require "xxx.lsp.utils"
    lu.setup_document_highlight(client, bufnr)
    -- lu.setup_format_on_save(client, bufnr, function()
    --   require("go.format").goimport()
    -- end)
    lu.setup_format_on_save(client, bufnr)
    lu.setup_fold()
    lsp.add_lsp_buffer_options(bufnr)
  end, -- it is a function with same signature as on_attach, will be called at end of
  -- on_attach and allows you override some setup
  lsp_document_formatting = true,
  -- set to true: use gopls to format
  -- false if you want to use other formatter tool(e.g. efm, nulls)

  null_ls_document_formatting_disable = false, -- true: disable null-ls formatting
  -- if enable gopls to format the code and you also instlled and enabled null-ls, you may
  -- want to disable null-ls by setting this to true
  -- it can be a nulls source name e.g. `golines` or a nulls query table
  lsp_keymaps = true, -- true: use default keymaps defined in go/lsp.lua
  lsp_codelens = true,
  lsp_diag_hdlr = false, -- hook lsp diag handler **
  lsp_diag_underline = true,
  -- virtual text setup
  lsp_diag_virtual_text = { space = 0, prefix = "" },
  lsp_diag_signs = true,
  lsp_inlay_hints = {
    enable = true,
    -- Only show inlay hints for the current line
    only_current_line = false,
    -- Event which triggers a refersh of the inlay hints.
    -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
    -- not that this may cause higher CPU usage.
    -- This option is only respected when only_current_line and
    -- autoSetHints both are true.
    only_current_line_autocmd = "CursorHold",
    -- whether to show variable name before type hints with the inlay hints or not
    -- default: false
    show_variable_name = true,
    -- prefix for parameter hints
    parameter_hints_prefix = " ",
    show_parameter_hints = true,
    -- prefix for all the other hints (type, chaining)
    -- default: "=>"
    other_hints_prefix = "=> ",
    -- whether to align to the lenght of the longest line in the file **
    max_len_align = true,
    -- padding from the left if max_len_align is true
    max_len_align_padding = 1,
    -- whether to align to the extreme right or not **
    right_align = false,
    -- padding from the right if right_align is true
    right_align_padding = 6,
    -- The color of the hints
    highlight = "Comment",
  },
  lsp_diag_update_in_insert = false,
  lsp_fmt_async = false, -- async lsp.buf.format, but will lose save ??
  go_boilplater_url = "https://github.com/thockin/go-build-template.git",
  gopls_cmd = nil,       --- you can provide gopls path and cmd if it not in PATH, e.g. cmd = {  "/home/ray/.local/nvim/data/lspinstall/go/gopls" }
  gopls_remote_auto = true,
  gocoverage_sign = "█",
  sign_covered_hl = "String",  --- highlight group for test covered sign, you can either
  sign_uncovered_hl = "Error", -- highlight group for uncovered code
  launch_json = nil,           -- the launch.json file path, default to .vscode/launch.json
  -- launch_json = vfn.getcwd() .. "/.vscode/launch.json",
  dap_debug = true,
  dap_debug_gui = true,
  dap_debug_keymap = true, -- true: use keymap for debugger defined in go/dap.lua
  -- false: do not use keymap in go/dap.lua.  you must define your own.
  dap_vt = true,           -- false, true and 'all frames'
  dap_port = 38697,        -- can be set to a number or `-1` so go.nvim will pickup a random port
  build_tags = "",         --- you can provide extra build tags for tests or debugger
  textobjects = false,     -- treesitter binding for text objects **, 启用会影响到treesitter的自定义安装路径
  test_runner = "go",      -- one of {`go`, `richgo`, `dlv`, `ginkgo`, `gotestsum`}
  verbose_tests = true,    -- set to add verbose flag to tests
  run_in_floaterm = false, -- set to true to run in float window.
  trouble = true,          -- true: use trouble to open quickfix **
  test_efm = false,        -- errorfomat for quickfix, default mix mode, set to true will be efm only
  luasnip = true,          -- enable included luasnip **
  username = "",
  useremail = "",
  disable_per_project_cfg = false, -- set to true to disable load script from .gonvim/init.lua
}

function M.setup()
  local go = require("go")
  go.setup(M.opts)
end

return M
