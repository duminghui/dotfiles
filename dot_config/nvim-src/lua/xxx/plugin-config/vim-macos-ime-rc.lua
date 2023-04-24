local M = {}

function M.setup()
  if vim.loop.os_uname().machine == 'arm64' then
    vim.g.macosime_normal_ime = 'com.apple.keylayout.ABC'
  else
    vim.g.macosime_normal_ime = 'com.apple.keylayout.US'
  end
  vim.g.macosime_cjk_ime = 'im.rime.inputmethod.Squirrel.Hans'
  vim.g.macosime_auto_detect = 0
end

return M
