local M = {}

function M.opts()
  local Path = require('plenary.path')
  return {
    sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
    path_replacer = '__', -- The character to which the path separator will be replaced for session files.
    colon_replacer = '++', -- The character to which the colon symbol will be replaced for session files.
    -- autoload_mode = require('session_manager.config').AutoloadMode.LastSession, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
    autoload_mode = "Disabled",
    autosave_last_session = true, -- Automatically save last session on exit and on session switch.iw
    autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
    autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
      'gitcommit',
    },
    autosave_only_in_session = true, -- Always autosaves session. If true, only autosaves after a session is active.
    max_path_length = 80, -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
  }
end

function M.setup()
  local status_ok, session_manager = safe_require("session_manager")
  if not status_ok then
    return
  end
  session_manager.setup(M.opts())
end

return M
