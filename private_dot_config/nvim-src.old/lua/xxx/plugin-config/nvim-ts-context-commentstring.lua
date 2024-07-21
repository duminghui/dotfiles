local M = {}

M.opts = {
  enable_autocmd = false,
  languages = {
    -- lua = '-- %s',
    -- Languages that have a single comment style
    css = '/* %s */',
    -- scss = '/* %s */',
    html = '<!-- %s -->',
    json = '',
    scss = '// %s',
    svelte = '<!-- %s -->',
    typescript = '// %s',
    vue = '<!-- %s -->',
  },
}

function M.setup()
  vim.g.skip_ts_context_commentstring_module = true
  local ts_c_c = require('ts_context_commentstring')
  ts_c_c.setup(M.opts)
end

return M
