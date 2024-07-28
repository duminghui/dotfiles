if not vim.g.vscode then
  return
end

local fmt = string.format
local vscode = require("vscode")

local function cmd(c)
  return fmt("<CMD>%s<CR>", c)
end

local function vscode_action(vs_action)
  return cmd(fmt('lua require"vscode".action("%s")', vs_action))
end

local function cursor_move(to)
  return function()
    local count = vim.api.nvim_get_vvar("count")
    local args = {
      to = to,
      by = "wrappedLine",
      value = count,
    }
    if count > 0 then
      args = {
        to = to,
        value = count,
      }
    end
    vscode.action("cursorMove", { args = args })
  end
end

local function manageEditorSize(wh, opt)
  local vs_action = ""
  if wh == "w" then
    if opt == "increase" then
      vs_action = "workbench.action.increaseViewWidth"
    else
      vs_action = "workbench.action.decreaseViewWidth"
    end
  else
    if opt == "decrease" then
      vs_action = "workbench.action.decreaseViewHeight"
    else
      vs_action = "workbench.action.increaseViewHeight"
    end
  end
  return function()
    local count = vim.api.nvim_get_vvar("count")
    if count == 0 then
      count = 1
    end
    for _ = 1, count, 1 do
      vscode.call(vs_action)
    end
  end
end

local keymaps = {
  { "n", "<leader>w", vscode_action("workbench.action.files.save") },
  { "n", "k", cursor_move("up") },
  { "n", "j", cursor_move("down") },
  { "n", "<leader>ff", vscode_action("workbench.action.quickOpen") },
  -- 无输入框
  -- ['<leader>fb'] = { 'n', vscode('workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup') },
  -- 有输入框
  -- ['<leader>fb'] = { 'n', vscode('workbench.action.showEditorsInActiveGroup') },
  { "n", "<leader>fb", vscode_action("workbench.action.showAllEditors") },
  -- ['<leader>fb'] = { 'n', vscode('workbench.action.showAllEditorsByMostRecentlyUsed') },

  -- 从终端跳到编辑器
  -- 需要在vscode中配置keybindings
  -- {
  --   "command": "vscode-neovim.send",
  --   // the key sequence to activate the binding
  --   "key": ", b b",
  --   // don't activate during insert mode
  --   "when": "terminalFocus",
  --   // the input to send to Neovim
  --   "args": ",bb"
  -- }
  { "n", "<leader>bb", vscode_action("workbench.action.focusActiveEditorGroup") },
  { "n", "<leader>bd", vscode_action("workbench.action.closeActiveEditor") },
  { "n", "<leader>e", vscode_action("workbench.view.explorer") },
  { "n", "gr", vscode_action("editor.action.referenceSearch.trigger") },
  { "n", "gI", vscode_action("editor.action.peekImplementation") },
  { "n", "<leader>cr", vscode_action("editor.action.rename") },

  { "n", "<A-j>", manageEditorSize("h", "increase") },
  { "n", "<A-k>", manageEditorSize("h", "decrease") },
  { "n", "<A-l>", manageEditorSize("w", "increase") },
  { "n", "<A-h>", manageEditorSize("w", "decrease") },

  { "n", "[d", vscode_action("editor.action.marker.prev") },
  { "n", "]d", vscode_action("editor.action.marker.next") },
}

keymappings(keymaps)
