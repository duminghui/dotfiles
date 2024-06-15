local M = {}
local icons = require('xxx.core.icons')

M.opts = {
  ui = {
    -- Whether to automatically check for new versions when opening the :Mason window.
    check_outdated_packages_on_open = true,
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    -- border = "rounded",
    -- border = 'single',
    border = 'none',
    icons = {
      -- -- The list icon to use for installed packages.
      -- package_installed = "◍",
      -- -- The list icon to use for packages that are installing, or queued for installation.
      -- package_pending = "◍",
      -- -- The list icon to use for packages that are not installed.
      -- package_uninstalled = "◍",
      package_installed = icons.ui.CircleCheck,
      package_pending = icons.ui.Pending,
      package_uninstalled = icons.ui.Plus2, -- 󰙝
    },
    keymaps = {
      -- Keymap to expand a package
      toggle_package_expand = '<CR>',
      -- Keymap to install the package under the current cursor position
      install_package = 'i',
      -- Keymap to reinstall/update the package under the current cursor position
      update_package = 'u',
      -- Keymap to check for new version for the package under the current cursor position
      check_package_version = 'c',
      -- Keymap to update all installed packages
      update_all_packages = 'U',
      -- Keymap to check which installed packages are outdated
      check_outdated_packages = 'C',
      -- Keymap to uninstall a package
      uninstall_package = 'X',
      -- Keymap to cancel a package installation
      cancel_installation = '<C-c>',
      -- Keymap to apply language filter
      apply_language_filter = '<C-f>',
    },
  },
  log_level = vim.log.levels.DEBUG,
  max_concurrent_installers = 3,
  -- github = {
  --     -- The template URL to use when downloading assets from GitHub.
  --     -- The placeholders are the following (in order):
  --     -- 1. The repository (e.g. "rust-lang/rust-analyzer")
  --     -- 2. The release version (e.g. "v0.3.0")
  --     -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
  --     download_url_template = "https://github.com/%s/releases/download/%s/%s",
  -- },
}

function M.setup()
  local mason = require('mason')

  mason.setup(M.opts)
end

return M
