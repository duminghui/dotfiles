local M = {}

function M.setup()
  vim.g.macosime_normal_ime = 'com.apple.keylayout.ABC'
  vim.g.macosime_cjk_ime = 'im.rime.inputmethod.Squirrel.Hans'
  vim.g.macosime_auto_detect = 0
end

return M
