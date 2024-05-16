local M = {}

function M.setup()
  -- $ brew tap laishulu/macism
  -- $ brew install macism
  -- output the current input source
  -- $ macism
  if vim.loop.os_uname().machine == 'arm64' then
    vim.g.macosime_normal_ime = 'com.apple.keylayout.ABC'
  else
    vim.g.macosime_normal_ime = 'com.apple.keylayout.US'
  end
  -- 鼠须管
  vim.g.macosime_cjk_ime = 'im.rime.inputmethod.Squirrel.Hans'
  -- 简体拼音
  -- vim.g.macosime_cjk_ime = 'com.apple.inputmethod.SCIM.ITABC'
  -- 简体五笔
  -- vim.g.macosime_cjk_ime = 'com.apple.inputmethod.SCIM.WBX'
  vim.g.macosime_auto_detect = 0
end

return M
