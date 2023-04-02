local M = {}
M.opts = {
  filetypes = { '*', '!mason', '!lazy' },
  user_default_options = {
    always_update = true,
  },
}

function M.setup()
  require('colorizer').setup(M.opts)
end

return M
