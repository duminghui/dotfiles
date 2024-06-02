local M = {}
M.opts = {
  filetypes = { '*', '!mason', '!lazy' },
  user_default_options = {
    RGB = true, -- #RGB hex codes
    RRGGBB = true, -- #RRGGBB hex codes
    names = true, -- "Name" codes like Blue or blue
    RRGGBBAA = true, -- #RRGGBBAA hex codes
    AARRGGBB = false, -- 0xAARRGGBB hex codes
    mode = 'background',
    -- mode = 'foreground',
    -- mode = 'virtualtext',
    always_update = true,
  },
}

function M.setup()
  require('colorizer').setup(M.opts)
end

return M
