local M = {}

function M.opts(_, opts)
  local coms = require("plugins.ui.lualine-components")
  -- local icons = LazyVim.config.icons
  local opts_new = {
    options = {
      theme = "xxx",
      -- 在组件中设置了separator, 下面两个就不起作用了
      -- 同一个section中不同组件间的间格
      component_separators = { left = " ", right = "" },
      section_separators = { left = " ", right = "" },
      always_divide_middle = true,
    },
    sections = {
      lualine_a = {
        coms.mode,
        coms.empty,
      },
      lualine_b = {
        coms.filename,
        coms.empty,
        coms.branch,
        coms.diff,
        coms.empty,
        coms.diagnostics,
        coms.empty,
      },
      lualine_c = {},
      lualine_x = {
        ---@diagnostic disable: undefined-field
        -- stylua: ignore
        {
          function() return require("noice").api.status.mode.get() end,
          cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
          color = function() return LazyVim.ui.fg("Constant") end,
        },
        -- stylua: ignore
        {
          function() return require("noice").api.status.command.get() end,
          cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
          color = function() return LazyVim.ui.fg("Statement") end,
        },
        -- -- stylua: ignore
        -- {
        --   function() return "  " .. require("dap").status() end,
        --   cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
        --   color = function() return LazyVim.ui.fg("Debug") end,
        -- },
        -- stylua: ignore
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
          color = function() return LazyVim.ui.fg("Special") end,
        },
      },
      lualine_y = {},
      lualine_z = {
        coms.empty,
        coms.treesitter,
        coms.empty,
        coms.lsp_clients,
        coms.empty,
        coms.session_status,
        coms.empty,
        coms.file_info,
        coms.empty,
        coms.location,
        coms.progress,
        coms.scrollbar,
      },
    },
    extensions = {
      "neo-tree",
      "mason",
      -- lazy要在globalstatus为true的情况下才会出现
      "lazy",
    },
  }

  opts = vim.tbl_deep_extend("force", opts, opts_new)
  return opts
end

return {
  "nvim-lualine/lualine.nvim",
  opts = M.opts,
}
