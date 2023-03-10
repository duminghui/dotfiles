local util = require "lspconfig.util"
local lsp = require "xxx.lsp"

local root_dir = nil

-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/rust_analyzer.lua
local function get_root_dir(fname)
  local cargo_crate_dir = util.root_pattern "Cargo.toml"(fname)
  local cmd = { "cargo", "metadata", "--no-deps", "--format-version", "1" }
  if cargo_crate_dir ~= nil then
    cmd[#cmd + 1] = "--manifest-path"
    cmd[#cmd + 1] = util.path.join(cargo_crate_dir, "Cargo.toml")
  end
  local cargo_metadata = ""
  local cargo_metadata_err = ""
  local cm = vim.fn.jobstart(cmd, {
    on_stdout = function(_, d, _)
      cargo_metadata = table.concat(d, "\n")
    end,
    on_stderr = function(_, d, _)
      cargo_metadata_err = table.concat(d, "\n")
    end,
    stdout_buffered = true,
    stderr_buffered = true,
  })
  if cm > 0 then
    cm = vim.fn.jobwait({ cm })[1]
  else
    cm = -1
  end
  local cargo_workspace_dir = nil
  if cm == 0 then
    cargo_workspace_dir = vim.json.decode(cargo_metadata)["workspace_root"]
    if cargo_workspace_dir ~= nil then
      cargo_workspace_dir = util.path.sanitize(cargo_workspace_dir)
    end
  else
    vim.notify(
      string.format("[XXX] cmd (%q) failed:\n%s", table.concat(cmd, " "), cargo_metadata_err),
      vim.log.levels.WARN
    )
  end
  return cargo_workspace_dir
    or cargo_crate_dir
    or util.root_pattern "rust-project.json"(fname)
    or util.find_git_ancestor(fname)
end

local opts = vim.tbl_deep_extend("keep", {
  root_dir = function(fname)
    local function get()
      root_dir = get_root_dir(fname)
      return root_dir
    end
    return root_dir or get()
  end,
  settings = {
    ["rust-analyzer"] = {
      -- https://rust-analyzer.github.io/manual.html#configuration
      rustfmt = {
        extraArgs = { "+nightly" },
        overrideCommand = nil,
        rangeFormatting = { enable = false },
      },
    },
  },
}, lsp.get_common_opts())

return opts
