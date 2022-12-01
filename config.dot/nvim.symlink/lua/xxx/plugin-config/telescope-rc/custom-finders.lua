local M = {}

local lsp_opts = require("xxx.lsp.config")
local _, builtin = pcall(require, "telescope.builtin")
local _, themes = pcall(require, "telescope.themes")
local config_dir = vim.fn.stdpath("config")

function M.find_xvim_files(opts)
    opts = opts or {}
    local theme_opts = themes.get_ivy {
        sorting_strategy = "ascending",
        layout_strategy = "bottom_pane",
        prompt_prefix = ">> ",
        prompt_title = "~ XVim files ~",
        cwd = config_dir,
        search_dirs = { config_dir, lsp_opts.templates_dir },
    }
    opts = vim.tbl_deep_extend("force", theme_opts, opts)
    builtin.find_files(opts)
end

function M.grep_xvim_files(opts)
    opts = opts or {}
    local theme_opts = themes.get_ivy {
        sorting_strategy = "ascending",
        layout_strategy = "bottom_pane",
        prompt_prefix = ">> ",
        prompt_title = "~ Search XVim ~",
        cwd = config_dir,
        search_dirs = { config_dir, lsp_opts.templates_dir },
    }
    opts = vim.tbl_deep_extend("force", theme_opts, opts)
    builtin.live_grep(opts)
end

-- Smartly opens either git_files or find_files, depending on whether the working directory is
-- contained in a Git repo.
function M.find_project_files(opts)
    opts = opts or {}
    local ok = pcall(builtin.git_files, opts)

    if not ok then
        builtin.find_files(opts)
    end
end

return M
