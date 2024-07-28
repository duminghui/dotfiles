return {
  {
    "stevearc/conform.nvim",
    ---@class ConformOpts
    opts = {
      --- require("conform")
      ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
      formatters = {
        injected = { options = { ignore_errors = false } },
        shfmt = {
          prepend_args = { "-i", "2", "-ci" },
        },
      },
    },
  },
  -- {
  --   "stevearc/conform.nvim",
  --   ---@class ConformOpts
  --   opts = function(_, opts)
  --     vim.print(opts)
  --   end,
  -- },
}
