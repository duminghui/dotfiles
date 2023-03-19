local M = {}

-- local colors = require("xxx.core.colors")

M.opts = {
  dark_theme = "onedark_vivid", -- The default dark theme
  light_theme = "onelight", -- The default light theme
  caching = false, -- Use caching for the theme?
  cache_path = vim.fn.expand(vim.fn.stdpath "cache" .. "/onedarkpro/"), -- The path to the cache directory
  filetypes = {
    -- Override which filetype highlight groups are loaded
    markdown = true,
    python = true,
    ruby = true,
    yaml = true,
  },
  plugins = {
    -- Override which plugin highlight groups are loaded
    -- See the Supported Plugins section for a list of available plugins
    barbar = false,
    lsp_saga = true,
    marks = true,
    polygot = false,
    startify = false,
    telescope = true,
    trouble = true,
    vim_ultest = false,
    which_key = false,
    nvim_tree = true,
    nvim_cmp = true,
    hop = false,
  },
  styles = {
    -- Choose from "bold,italic,underline"
    strings = "NONE", -- Style that is applied to strings.
    comments = "italic", -- Style that is applied to comments
    -- comments = "NONE", -- Style that is applied to comments
    keywords = "NONE", -- Style that is applied to keywords
    functions = "NONE", -- Style that is applied to functions
    variables = "NONE", -- Style that is applied to variables
    virtual_text = "italic", -- Style that is applied to virtual text
  },
  options = {
    bold = false, -- Use the colorscheme's opinionated bold styles?
    italic = false, -- Use the colorscheme's opinionated italic styles?
    underline = false, -- Use the colorscheme's opinionated underline styles?
    undercurl = false, -- Use the colorscheme's opinionated undercurl styles?
    cursorline = true, -- Use cursorline highlighting?
    transparency = false, -- Use a transparent background?
    terminal_colors = false, -- Use the colorscheme's colors for Neovim's :terminal?
    window_unfocused_color = false, -- When the window is out of focus, change the normal background?
  },
  colors = {
    onedark_vivid = {
      -- vim = "#81b766", -- green
      -- brackets = "#abb2bf", -- fg / gray
      cursorline = "#2e323b",
      -- indentline = "#3c414d",
      ghost_text = "#555961",

      telescope_prompt = "#2e323b",
      telescope_results = "#21252d",
    },
  }, -- Override default colors by specifying colors for 'onelight' or 'onedark' themes
  highlights = {
    -- Editor
    FloatBorder = { fg = "${gray}", bg = "${float_bg}", blend = 9 },
    BufferlineOffset = { fg = "${purple}", style = "bold" },
    CursorColumn = { link = "CursorLine" },
    CursorLineNr = {
      -- fg = "${purple}",
      fg = "#FFD700",
      bg = "${cursorline}",
      style = "bold",
    },
    DiffChange = { style = "underline" }, -- diff mode: Changed line |diff.txt|
    MatchParen = { fg = "${cyan}", style = "underline" },
    ModeMsg = { link = "LineNr" }, -- Make command line text lighter
    Search = { bg = "${selection}", fg = "${yellow}", style = "underline" },
    -- StatusLine = { bg = "NONE", fg = "NONE" }, -- 防止statusline出现^^^^^.

    -- ["@text.uri.markdown"] = { fg = "${purple}" },

    -- Aerial plugin
    AerialClass = { fg = "${purple}", style = "bold,italic" },
    AerialClassIcon = { fg = "${purple}" },
    AerialConstructorIcon = { fg = "${yellow}" },
    AerialEnumIcon = { fg = "${blue}" },
    AerialFunctionIcon = { fg = "${red}" },
    AerialInterfaceIcon = { fg = "${orange}" },
    AerialMethodIcon = { fg = "${green}" },
    AerialStructIcon = { fg = "${cyan}" },
    -- Alpha (dashboard) plugin
    AlphaHeader = {
      fg = (vim.o.background == "dark" and "${green}" or "${red}"),
    },
    AlphaButtonText = {
      fg = "${blue}",
      style = "bold",
    },
    AlphaButtonShortcut = {
      fg = (vim.o.background == "dark" and "${green}" or "${yellow}"),
      style = "italic,bold",
    },
    AlphaFooter = { fg = "${gray}", style = "italic" },
    -- Cmp
    CmpItemAbbrMatch = { fg = "${blue}", style = "bold" },
    CmpItemAbbrMatchFuzzy = { fg = "${blue}", style = "underline" },
    GhostText = { fg = "${ghost_text}" },
    -- Copilot
    CopilotSuggestion = { fg = "${gray}", style = "italic" },
    -- DAP
    DebugBreakpointLine = { fg = "${red}", style = "underline" },
    DebugHighlightLine = { fg = "${purple}", style = "italic" },
    NvimDapVirtualText = { fg = "${cyan}", style = "italic" },
    -- DAP UI
    DapUIBreakpointsCurrentLine = { fg = "${yellow}", style = "bold" },
    -- Fidget plugin
    FidgetTitle = { fg = "${purple}" },
    FidgetTask = { fg = "${gray}" },
    -- Luasnip
    LuaSnipChoiceNode = { fg = "${yellow}" },
    LuaSnipInsertNode = { fg = "${yellow}" },
    -- Minimap
    MapBase = { fg = "${gray}" },
    MapCursor = { fg = "${purple}", bg = "${cursorline}" },
    -- MapRange = { fg = "${fg}" },

    -- Navic
    NavicText = { fg = "${gray}", style = "italic" },
    -- Neotest
    NeotestAdapterName = { fg = "${purple}", style = "bold" },
    NeotestFocused = { style = "bold" },
    NeotestNamespace = { fg = "${blue}", style = "bold" },
    -- Neotree
    NeoTreeRootName = { fg = "${purple}", style = "bold" },
    NeoTreeFileNameOpened = { fg = "${purple}", style = "italic" },
    -- Nvim-Tree
    NvimTreeFolderName = { link = "NvimTreeNormal" },
    NvimTreeRootFolder = { fg = "${purple}" },
    NvimTreeFolderIcon = { fg = "${yellow}" },
    NvimTreeOpenedFolderName = { link = "NvimTreeNormal" },
    NvimTreeGitDirty = { fg = "${yellow}" },
    -- Telescope
    -- TelescopeBorder = {
    --   fg = "${telescope_results}",
    --   bg = "${telescope_results}",
    -- },
    -- TelescopePromptBorder = {
    --   fg = "${telescope_prompt}",
    --   bg = "${telescope_prompt}",
    -- },
    TelescopePromptCounter = { fg = "${fg}" },
    TelescopePromptNormal = { fg = "${fg}", bg = "${telescope_prompt}" },
    TelescopePromptPrefix = {
      fg = "${purple}",
      bg = "${telescope_prompt}",
    },
    TelescopePromptTitle = {
      fg = "${telescope_prompt}",
      bg = "${purple}",
    },
    TelescopePreviewTitle = {
      fg = "${telescope_results}",
      bg = "${green}",
    },
    TelescopeResultsTitle = {
      -- fg = "${telescope_results}",
      -- bg = "${telescope_results}",
      fg = "${telescope_results}",
      bg = "${yellow}",
    },
    TelescopeMatching = { fg = "${blue}" },
    TelescopeNormal = { bg = "${telescope_results}" },
    TelescopeSelection = { bg = "${telescope_prompt}" },
  }, -- Override default highlight and/or filetype groups
}

function M.setup()
  local onedarkpro = require "onedarkpro"
  onedarkpro.setup(M.opts)
  vim.api.nvim_command "colorscheme onedark_vivid"

  vim.g.colors_name = "onedark_vivid"

  local colors = require("onedarkpro.helpers").get_colors(vim.g.onedarkpro_theme)

  -- local default_colors = {
  --   bg = "#282c34",
  --   fg = "#abb2bf",
  --   red = "#ef596f",
  --   orange = "#d19a66",
  --   yellow = "#e5c07b",
  --   green = "#89ca78",
  --   cyan = "#2bbac5",
  --   blue = "#61afef",
  --   purple = "#d55fde",
  --   white = "#abb2bf",
  --   black = "#282c34",
  --   gray = "#5c6370",
  --   highlight = "#e2be7d",
  --   comment = "#7f848e",
  --   none = "NONE",
  -- }

  local universal_colors = {
    yellow = colors.yellow,
    orange = colors.orange,
    red = colors.red,
    magenta = "magenta",
    violet = "violet",
    blue = colors.blue,
    cyan = colors.cyan,
    green = colors.green,
    purple = colors.purple,
    bufferline = {
      text = "#7f848e",
      text_selected = "#abb2bf",
      -- text_selected = "#949aa2",
      tag_fg = "#16181c",
      tag_bg = "#1E2127",
      modified = colors.red,
      pick = colors.purple,
    },
    statuline = {
      mode_fg = "#282c34",
      fg = "#5c6370",
      bg = "#2e323b",
    },
  }
  require("xxx.plugin-config.colorscheme.colors").set_colors(universal_colors)
  vim.opt.pumblend = 9
  vim.opt.winblend = 9
  Xvim.which_key_winblend = 9
  Xvim.winblend = 9
  -- vim.cmd(string.format("highlight CursorLineNr guifg=%s", "#FFD700"))
  -- 会把整个替换掉
  -- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFE700" })
end

return M
