local icons = xxx.icons

local left_sep_both = {
  left = " ",
  right = "",
}

local right_seq_both = {
  left = " ",
  right = "",
}

local M = {}

M.empty = { "empty", color = "SlEmpty" }

M.mode = {
  "mode",
  icons_enabled = true,
  icon = icons.misc.Neovim,
  separator = {
    right = "",
  },
}

M.filename = {
  "filename",
  color = "SlComponent",
  newfile_status = true,
  symbols = {
    modified = icons.ui.Dot,
    readonly = icons.ui.Lock,
    unnamed = "[No Name]",
    newfile = icons.ui.FilePlus,
  },
  separator = left_sep_both,
}

M.branch = {
  "git-branch",
  color = "SlComponent",
  icon = icons.git.Branch,
  separator = left_sep_both,
}

local function diff_source()
  local gitsigns = vim.b[0].gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

M.diff = {
  "diff",
  source = diff_source,
  symbols = {
    added = icons.git.BoldLineAdd .. " ",
    modified = icons.git.BoldLineModified .. " ",
    removed = icons.git.BoldLineRemove .. " ",
  },
  diff_color = {
    added = "SlDiffAdd",
    modified = "SlDiffChange",
    removed = "SlDiffDelete",
  },
  cond = nil,
  colored = true,
  padding = {
    left = 0,
    right = 1,
  },
  color = "SlComponent",
  separator = left_sep_both,
}

M.diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = {
    error = icons.diagnostic.Error .. " ",
    warn = icons.diagnostic.Warning .. " ",
    info = icons.diagnostic.Information .. " ",
    hint = icons.diagnostic.Hint .. " ",
  },
  color = "SlComponent",
  separator = left_sep_both,
}

M.treesitter = {
  function()
    return icons.ui.Tree
  end,
  color = function()
    local buf = vim.api.nvim_get_current_buf()
    local ts = vim.treesitter.highlighter.active[buf]
    return ts and not vim.tbl_isempty(ts) and "SlTreesitterActive" or "SlTreesitterInactive"
  end,
  separator = right_seq_both,
}

M.lsp_clients = {
  "lsp-clients",
  clients = {
    copilot = { symbol = icons.git.Octoface, color = "SlClientCopilot" },
  },
  icons = {
    active = icons.ui.LspActive,
    inactive = icons.ui.LspInactive,
  },
  icon = nil,
  color = function()
    return next(vim.lsp.get_clients({ bufnr = 0 })) ~= nil and "SlClientActive" or "SlClientInactive"
  end,
  separator = right_seq_both,
}

local function is_in_session()
  if not LazyVim.has("neovim-session-manager") then
    return false
  end
  return require("session_manager.utils").exists_in_session()
end

M.session_status = {
  function()
    return is_in_session() and icons.ui.CloudCheck or icons.ui.CloudOff
  end,
  color = function()
    return is_in_session() and "SlSessionActive" or "SlSessionInactive"
  end,
  separator = right_seq_both,
  cond = function()
    return LazyVim.has("neovim-session-manager")
  end,
}

M.file_info = {
  "file-info",
  color = "SlComponent",
  separator = right_seq_both,
}

M.location = {
  "location",
  color = "SlLocation",
  separator = {
    left = " ",
  },
}

M.progress = {
  "file-progress",
  color = "SlFileProgress",
}

M.scrollbar = {
  "file-scrollbar",
  color = "SlFileScrollbar",
  padding = 0,
}

-- local constants = require("overseer.constants")
-- local STATUS = constants.STATUS
--
-- M.overseer = {
--   "overseer",
--   symbols = {
--     [STATUS.FAILURE] = icons.diagnostics.BoldError,
--     [STATUS.CANCELED] = icons.diagnostics.BoldInformation,
--     [STATUS.SUCCESS] = icons.ui.BoldCircleCheck,
--     [STATUS.RUNNING] = icons.ui.Run,
--   },
--   color = { fg = com_fg, bg = com_bg },
--   icons_enabled = true,
--   separator = right_seq_both,
-- }

return M
