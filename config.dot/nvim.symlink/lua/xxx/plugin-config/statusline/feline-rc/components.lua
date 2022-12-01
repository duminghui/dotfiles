local M = {}

local colors = require("xxx.plugin-config.colorscheme.colors").colors()
local icons = require("xxx.core.icons")
local vi_mode_utils = require("feline.providers.vi_mode")

-- local com_bg = "#33373E"
local com_bg = "#2E323B"
-- local com_bg = colors.statusline_bg
-- local com_bg = "#282c34"
-- local com_bg = "#22252C"

M.filetypes_to_mask = {
    "^aerial$",
    "^neo--tree$",
    "^neo--tree--popup$",
    "^NvimTree$",
    "^toggleterm$",
    "^lspsagaoutline$",
    "^mason$"
}

-- local function hide_in_width()
--     return vim.api.nvim_win_get_width(0) > 80
-- end

local function mask_plugin()
    return find_pattern_match(M.filetypes_to_mask, vim.bo.filetype)
end

M.filler = {
    hl = {
        fg = com_bg,
        bg = colors.bg,
    }
}

M.vi_mode = {
    provider = function()
        return " " .. vi_mode_utils.get_vim_mode() .. " "
    end,
    icon = "",
    hl = function()
        return {
            name = vi_mode_utils.get_mode_highlight_name(),
            fg = colors.bg,
            bg = vi_mode_utils.get_mode_color(),
        }
    end,
    right_sep = {
        {
            str = "slant_right",
            hl = function()
                return {
                    fg = vi_mode_utils.get_mode_color(),
                    bg = colors.bg,
                }
            end,
        }
    },
    priority = 100,

}

local left_section_left_sep = {
    str = "slant_left_2",
    hl = {
        fg = com_bg,
        bg = "None"
    }
}

local left_section_right_sep = {
    str = "slant_right",
    hl = {
        fg = com_bg,
        bg = "None"
    }
}

M.file_info = {
    provider = function()
        local file = require("feline.providers.file").file_info({ icon = "" },
            { type = "short", file_readonly_icon = icons.ui.Lock2 .. " " })
        if mask_plugin() then
            file = vim.bo.filetype
        end

        return " " .. file .. " "
    end,
    icon = "",
    -- enabled = hide_in_width,
    hl = {
        fg = colors.gray,
        bg = com_bg,
    },
    left_sep = left_section_left_sep,
    right_sep = left_section_right_sep,
    priority = 100,
}

local provider_git = require("xxx.plugin-config.statusline.feline-rc.providers.git")

-- Common function used by the git providers
M.git = {
    provider = function(component)
        return provider_git.git_provider(component, false)
    end,
    short_provider = function(component)
        return provider_git.git_provider(component, true)
    end,
    opts = {
        symbols = {
            branch = icons.git.Branch,
            added = icons.git.BoldLineAdd,
            changed = icons.git.LineModified,
            removed = icons.git.BoldLineRemove,
        },
        short_symbols = {
            added = "+",
            changed = "~",
            removed = "-",
        },
        diff_hls = {
            branch = { fg = colors.gray, bg = com_bg },
            added = { fg = colors.green, bg = com_bg },
            changed = { fg = colors.orange, bg = com_bg },
            removed = { fg = colors.red, bg = com_bg },
        },
    },
    enabled = function()
        return provider_git.git_info_exists()
    end,
    hl = {
        -- fg = colors.gray,
        -- bg = com_bg,
        fg = "None",
        bg = "None",
    },
    left_sep = left_section_left_sep,
    right_sep = left_section_right_sep,
    truncate_hide = true,
    priority = 10,
}

local provider_lsp = require("xxx.plugin-config.statusline.feline-rc.providers.lsp")

M.lsp_diagnostics = {
    provider = function(component)
        return provider_lsp.diagnostics_provider(component, false)
    end,
    short_provider = function(component)
        return provider_lsp.diagnostics_provider(component, true)
    end,
    opts = {
        update_in_insert = false,
        symbols = {
            error = icons.diagnostics.BoldError,
            warn = icons.diagnostics.BoldWarning,
            info = icons.diagnostics.BoldInformation,
            hint = icons.diagnostics.BoldHint,
        },
        sections = { "error", "warn", "info", "hint" },
        hls = {
            error = { scope = "fg", parent = "DiagnosticError", bg = com_bg },
            warn = { scope = "fg", parent = "DiagnosticWarn", bg = com_bg },
            info = { scope = "fg", parent = "DiagnosticInfo", bg = com_bg },
            hint = { scope = "fg", parent = "DiagnosticHint", bg = com_bg },
        },
    },

    enabled = function()
        return provider_lsp.is_diagnostics_attached()
    end,
    hl = {
        fg = "None",
        bg = "None",
    },
    left_sep = left_section_left_sep,
    right_sep = left_section_right_sep,
    truncate_hide = true,
    priority = 11,
}

local right_section_left_sep = {
    str = "slant_left",
    hl = {
        fg = com_bg,
        bg = "None",
    }
}

local right_section_right_sep = {
    str = "slant_right_2",
    hl = {
        fg = com_bg,
        bg = "None",
    }
}

-- local right_section_right_sep_thin = {
--     str = "vertical_bar_thin",
--     hl = {
--         fg = com_bg,
--         bg = "None"
--     }
-- }

M.lsp_info = {
    provider = provider_lsp.lsp_info_provider,
    opts = {
        clients = {
            copilot = { symbol = icons.git.Octoface, hl = { fg = "#6CC644", bg = com_bg } }
        },
    },
    short_provider = function()
        return ""
    end,
    hl = function()
        local fg = colors.orange
        if provider_lsp.is_lsp_info_attached() then
            fg = colors.green
        end
        return {
            fg = fg,
            bg = com_bg,
        }
    end,
    icon = {
        -- str = '  ',
        str = ' ' .. icons.ui.LspActive .. ' ',
        always_visible = true,
    },
    left_sep = {
        str = "slant_left",
        hl = {
            fg = com_bg,
            bg = "None",
        },
        always_visible = true,
    },
    right_sep = {
        str = "slant_right_2",
        hl = {
            fg = com_bg,
            bg = "None",
        },
        always_visible = true,
    },
    -- enabled = hide_in_width,
    truncate_hide = true,
    priority = 9,
}

M.treesitter = {
    provider = " " .. icons.ui.Tree .. " ",
    hl = function()
        local buf = vim.api.nvim_get_current_buf()
        local ts = vim.treesitter.highlighter.active[buf]
        local fg = ts and not vim.tbl_isempty(ts) and colors.blue or colors.red
        return {
            fg = fg,
            bg = com_bg,
        }
    end,
    left_sep = right_section_left_sep,
    right_sep = right_section_right_sep,
    truncate_hide = true,
    priority = 8,
}

local provider_parts = require("xxx.plugin-config.statusline.feline-rc.providers.parts")

M.file_detail = {
    provider = function(component)
        return provider_parts.provider(component, {
            parts = {
                {
                    -- space
                    content = function()
                        local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
                        if shiftwidth > 0 then
                            return icons.ui.Tab .. shiftwidth
                        else
                            local tabstop = vim.api.nvim_buf_get_option(0, "tabstop")
                            return "•:" .. tabstop
                        end
                    end,
                },
                {
                    -- encoding
                    content = function()
                        return ((vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc):upper()
                    end
                },
                {
                    -- format
                    content = function()
                        return ((vim.bo.fileformat ~= '' and vim.bo.fileformat) or vim.o.fileformat):upper()
                    end,
                },
                {
                    -- filetype
                    content = function()
                        return require("feline.providers.file").file_type({},
                            { filetype_icon = true, colored_icon = true, case = "lowercase" })
                    end,
                }
            },
            sep = ' ',
        })
    end,
    short_provider = function(component)
        return provider_parts.provider(component, {
            parts = {
                {
                    -- space
                    content = function()
                        local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
                        if shiftwidth > 0 then
                            return shiftwidth
                        else
                            local tabstop = vim.api.nvim_buf_get_option(0, "tabstop")
                            return tabstop
                        end
                    end
                },
                {
                    -- encoding
                    content = function()
                        return ((vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc):upper()
                    end,
                },
                {
                    -- filetype
                    content = function()
                        local _, icon = require("feline.providers.file").file_type({},
                            { filetype_icon = true, colored_icon = true, case = "lowercase" })
                        return "", icon
                    end,
                }
            },
            sep = ' ',
        })
    end,

    hl = {
        fg = colors.gray,
        bg = com_bg,
    },
    left_sep = right_section_left_sep,
    right_sep = right_section_right_sep,
    truncate_hide = true,
    priority = 5,
}

M.position = {
    provider = {
        name = "position",
        opts = {
            padding = {
                line = 2,
                col = 2,
            },
            format = " {line}:{col} "
        }
    },
    hl = {
        fg = colors.statusline_bg,
        bg = colors.green,
    },
    left_sep = {
        str = "slant_left",
        hl = {
            fg = colors.green,
            bg = "NONE",
        }
    },
    truncate_hide = true,
    priority = 99,
}

local function line_percentage()
    local curr_line = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_line_count(0)
    local percent = string.format("%s", 100)

    if curr_line ~= lines then
        percent = string.format("%3d", math.ceil(curr_line / lines * 99))
    end

    return lines, percent
end

M.line_percentage = {
    provider = function()
        local lines, percent = line_percentage()
        return " " .. percent .. "%%|" .. lines .. " "
    end,
    hl = {
        fg = colors.statusline_bg,
        bg = colors.orange,
    },
    truncate_hide = true,
    priority = 99,
}

M.scroll_bar = {
    provider = {
        name = "scroll_bar",
        opts = {
            reverse = false,
        }
    },
    hl = {
        fg = "#FFD700",
        bg = "None",
    },
    truncate_hide = true,
    priority = 99,
}

local function is_session()
    -- return vim.g.persisting
    return require("session_manager.utils").is_session
end

M.sessions = {
    provider = function()
        if is_session() then
            -- return "  "
            return " " .. icons.ui.SessionIn .. " "
        end
        -- return "  "
        return " " .. icons.ui.SessionOut .. " "
    end,
    -- enabled = function()
    --     return (vim.g.persisting ~= nil)
    -- end,
    hl = function()
        local fg = colors.red
        if is_session() then
            fg = colors.green
        end
        return {
            fg = fg,
            bg = com_bg,
        }
    end,
    left_sep = right_section_left_sep,
    right_sep = right_section_right_sep,
    truncate_hide = true,
    priority = 4,
}

local sl_overseer = require("xxx.plugin-config.statusline.feline-rc.sl_overseer")

M.overseer = {
    provider = function()
        local status, icon = sl_overseer.status()
        return status, icon
    end,
    enabled = function()
        local status, _ = sl_overseer.status()
        return status ~= false
    end,
    hl = function()
        local status, _ = sl_overseer.status()
        if status == "FAILURE" then
            return {
                fg = colors.red,
                bg = "NONE",
            }
        elseif status == "SUCCESS" then
            return {
                fg = colors.green,
                bg = "NONE",
            }
        elseif status == "RUNNING" then
            return {
                fg = colors.yellow,
                bg = "NONE",
            }
        else
            return {
                fg = colors.gray,
                bg = "NONE",
            }
        end
    end,
    left_sep = right_section_left_sep,
    right_sep = right_section_right_sep,
}

function M.init()
end

return M
