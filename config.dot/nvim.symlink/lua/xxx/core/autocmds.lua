local M = {}
local Log = require "xxx.core.log"

--- Load the default set of autogroups and autocommands.
function M.load_defaults()

  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = {
      "Jaq",
      "qf",
      -- "help",
      "man",
      "lspinfo",
      "spectre_panel",
      "lir",
      "DressingSelect",
      "tsplayground",
      -- "Markdown",
    },
    callback = function()
      vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      nnoremap <silent> <buffer> <esc> :close<CR>
      set nobuflisted
    ]]
    end,
  })

  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = {
      "alpha",
    },
    callback = function()
      vim.cmd [[
      nnoremap <silent> <buffer> q :qa<CR>
      nnoremap <silent> <buffer> <esc> :qa<CR>
      set nobuflisted
    ]]
    end,
  })

  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "lir" },
    callback = function()
      vim.opt_local.number = false
      vim.opt_local.relativenumber = false
    end,
  })

  -- TODO: figure out what keeps overriding laststatus
  -- vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  --     pattern = { "*" },
  --     callback = function()
  --         vim.opt.laststatus = 3 -- Use global statusline
  --     end,
  -- })

  local definitions = {
    {
      "TextYankPost",
      {
        group = "_general_settings",
        pattern = "*",
        desc = "Highlight text on yank",
        callback = function()
          require("vim.highlight").on_yank { higroup = "Search", timeout = 200 }
        end,
      },
    },
    {
      "FileType",
      {
        group = "_filetype_settings",
        pattern = "qf",
        command = "set nobuflisted",
      },
    },
    {
      "FileType",
      {
        group = "_filetype_settings",
        pattern = { "gitcommit", "markdown" },
        command = "setlocal wrap spell",
      },
    },
    {
      "FileType",
      {
        group = "_filetype_settings",
        pattern = "go",
        callback = function()
          vim.opt_local.listchars = "tab:› ,trail:•,extends:#,nbsp:."
        end,
      }
    },
    {
      "FileType",
      {
        group = "_buffer_mappings",
        pattern = {
          "qf",
          -- "help",
          "man",
          "floaterm",
          "lspinfo",
          "lsp-installer",
          "null-ls-info",
        },
        command = "nnoremap <silent> <buffer> q :close<CR>",
      },
    },
    {
      { "BufWinEnter", "BufRead", "BufNewFile" },
      {
        group = "_format_options",
        pattern = "*",
        -- command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
        command = "setlocal formatoptions-=c",
      },
    },
    {
      "VimResized",
      {
        group = "_auto_resize",
        pattern = "*",
        command = "tabdo wincmd =",
      },
    },
    {
      "ColorScheme",
      {
        group = "_xxx_colorscheme",
        callback = function()
          vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
          vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#CA42F0" })
          vim.api.nvim_set_hl(0, "CmpItemKindCrate", { fg = "#F64D00" })
          vim.api.nvim_set_hl(0, "CmpItemKindEmoji", { fg = "#FDE030" })

        end
      }
    },
    -- {
    --     { "BufNewFile", "BufRead" },
    --     {
    --         group = "_set_filetype",
    --         pattern = "go.mod",
    --         command = "set filetype=gomod",
    --     }
    -- },
    -- {
    --     { "BufNewFile", "BufRead" },
    --     {
    --         group = "_set_filetype",
    --         pattern = "go.sum",
    --         command = "set filetype=gosum",
    --     }
    -- },
    -- {
    --     { "BufNewFile", "BufRead" },
    --     {
    --         group = "_set_filetype",
    --         pattern = "tasks.json",
    --         command = "set filetype=jsonc",
    --     }
    -- },
  }

  M.define_autocmds(definitions)
end

--- Clean autocommand in a group if it exists
--- This is safer than trying to delete the augroup itself
---@param name string the augroup name
function M.clear_augroup(name)
  -- defer the function in case the autocommand is still in-use
  Log:debug("request to clear autocmds  " .. name)
  vim.schedule(function()
    pcall(function()
      vim.api.nvim_clear_autocmds { group = name }
    end)
  end)
end

--- Create autocommand groups based on the passed definitions
--- Also creates the augroup automatically if it doesn't exist
---@param definitions table contains a tuple of event, opts, see `:h nvim_create_autocmd`
function M.define_autocmds(definitions)
  for _, entry in ipairs(definitions) do
    local event = entry[1]
    local opts = entry[2]
    if type(opts.group) == "string" and opts.group ~= "" then
      local exists, _ = pcall(vim.api.nvim_get_autocmds, { group = opts.group })
      if not exists then
        vim.api.nvim_create_augroup(opts.group, {})
      end
    end
    vim.api.nvim_create_autocmd(event, opts)
  end
end

return M
