local M = {}
function M.opts()
    local sessions_dir = join_paths(vim.fn.stdpath('data'), 'sessions', '') -- The directory where the session files will be saved.
    return {
        save_dir = sessions_dir,
        command = "VimLeavePre", -- the autocommand for which the session is saved
        silent = false, -- silent nvim message when sourcing session file
        use_git_branch = true,
        branch_separator = "_", -- string used to separate session directory name from branch name
        autosave = false, -- automatically save session files when exiting Neovim
        should_autosave = function()
            if vim.bo.filetype == "alpha" then
                return false
            end
            return true
        end,
        autoload = false, -- automatically load the session for the cwd on Neovim startup
        on_autoload_no_session = nil, -- function to run when `autoload = true` but there is no session to load
        follow_cwd = true, -- change session file name to match current working directory if it changes
        allowed_dirs = nil, -- table of dirs that the plugin will auto-save and auto-load from
        ignored_dirs = nil, -- table of dirs that are ignored when auto-saving and auto-loading
        before_save = function()
            -- Clear out Minimap before saving the session
            -- With Minimap open it stops the session restoring to the last cursor position
            pcall(vim.cmd, "bw NvimTree")
            pcall(vim.cmd, "bw minimap")
        end,
        after_save = nil, -- function to run after the session is saved to disk
        after_source = nil, -- function to run after the session is sourced
        telescope = {
            before_source = function()
                vim.api.nvim_input("<ESC>:%bd!<CR>")
                require "persisted".stop()
            end,
            after_source = nil, -- function to run after the session is sourced via telescope
        },

    }
end

function M.setup()
    local status_ok, persisted = safe_require("persisted")
    if not status_ok then
        return
    end
    persisted.setup(M.opts())
    require("telescope").load_extension("persisted")
end

return M
