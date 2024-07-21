---@type LazySpec
return {
  {
    "folke/persistence.nvim",
    enabled = false,
    keys = {
      { "<leader>qd", false },
      { "<leader>ql", false },
      { "<leader>qs", false },
    },
  },
  { "nvim-lua/plenary.nvim", lazy = true },
  {
    "Shatur/neovim-session-manager",
    event = "BufReadPre",
    opts = function()
      local Path = require("plenary.path")
      local sessions_dir = Path:new(vim.fn.stdpath("state"), "sessions")
      sessions_dir:mkdir()
      return {
        sessions_dir = sessions_dir, -- The directory where the session files will be saved.
        path_replacer = "__", -- The character to which the path separator will be replaced for session files.
        colon_replacer = "++", -- The character to which the colon symbol will be replaced for session files.
        -- autoload_mode = require('session_manager.config').AutoloadMode.LastSession, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
        autoload_mode = "Disabled",
        autosave_last_session = true, -- Automatically save last session on exit and on session switch.iw
        autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
        autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
          "gitcommit",
        },
        autosave_only_in_session = true, -- Always autosaves session. If true, only autosaves after a session is active.
        max_path_length = 80, -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
      }
    end,
    cmd = "SessionManager",
    keys = {
      { "<leader>ql", "<CMD>SessionManager load_session<CR>", desc = "Load Sessions" },
      { "<leader>qL", "<CMD>SessionManager load_last_session<CR>", desc = "Load Last Session" },
      { "<leader>qs", "<CMD>SessionManager save_current_session<CR>", desc = "Save Current Session" },
      { "<leader>qd", "<CMD>SessionManager delete_session<CR>", desc = "Delete Session" },
    },
  },
  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      local entities = {
        {
          action = "SessionManager load_session",
          desc = "Sessions",
          icon = xxx.icons.ui.WindowRestore .. "  ",
          key = "s",
        },
        {
          action = "SessionManager load_last_session",
          desc = "Last session",
          icon = xxx.icons.ui.Restore .. "  ",
          key = "L",
        },
      }

      for idx, entity in ipairs(opts.config.center) do
        if entity.key == "s" then
          table.remove(opts.config.center, idx)
          for idx_add, entity_add in ipairs(entities) do
            entity_add.desc = entity_add.desc .. string.rep(" ", 43 - #entity_add.desc)
            entity_add.key_format = "  %s"
            table.insert(opts.config.center, idx + idx_add - 1, entity_add)
          end
          break
        end
      end
    end,
  },
}
