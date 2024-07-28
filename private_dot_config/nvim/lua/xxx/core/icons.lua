local M = {
  kind = {
    ------ A ------
    Array = "󰅪", -- 󰅪 󰅨
    ------ B ------
    Boolean = "󰔡", -- 󰔡 󰨚
    ------ C ------
    Class = "󰌨", -- 󰌗 󰙅  EA4A
    Codeium = "󰘦 ",
    Color = "󰏘", --
    Control = "󰘬 ", -- 
    Collapsed = "󰅂 ", -- 
    Constant = "󰕶", -- 󰇽 󰏿
    Constructor = "󱀥", -- 󰆧 󰆦
    Copilot = " ",
    ------ D ------
    ------ E ------
    Enum = "󰷐", --   󰷐
    EnumMember = "󰍴", --   EA55
    Event = "󰉁", -- 󱐋
    ------ F ------
    Field = "", --   󰆧
    File = "󰈔", -- 󰈙 󰈔 󰈤
    Folder = "󰝰", -- 󰝰 󰉋
    Function = "󰡱", -- 󰊕 ƒ
    ------ G ------
    ------ H ------
    ------ I ------
    Interface = "󰀽", -- 󰀽 󰀿
    ------ J ------
    ------ K ------
    Key = "󱀍", -- 󰉿
    Keyword = "󰌆", -- 󰉨
    ------ L ------
    ------ M ------
    Macro = "󰐣", -- 󰬔
    Method = "󰊕", -- 󰡱 EA03
    Misc = "󰠱", -- #
    Module = "󰘦", -- 
    ------ N ------
    Namespace = "󰘦", -- 󰅩
    Null = "󰟢", --
    Number = "󰎠", --
    Numeric = "󰎠", --
    ------ O ------
    Object = "󰘦", -- 󰅩 󰙅 󰆩
    Operator = "", -- 󰆕 󰦒
    ------ P ------
    Package = "󰘦", -- 󰏗 󰏓
    Parameter = "󰘮", -- 
    Property = "󰖷", -- 󰄻 󰓹 󰖷 󰆧
    ------ Q ------
    ------ R ------
    Reference = "󰌹", -- 󰈇 󱞬 󰌷 󰌹
    Ruler = "󰑭", --
    ------ S ------
    Snippet = "󰃐", -- 󰌲 󰃐 󰗀 󱓡 󱓠 󰅌 󰆒
    StaticMethod = "󰊕", --
    String = "󰀬", -- 󰉿 󰀬 󱀍
    Struct = "󰆩", -- 󰆩  󰠱
    Structure = "󰆩", --
    ------ T ------
    TabNine = "󰏚 ",
    Text = "󰀬", -- 󰊄  󰭷 󰦩 󰦨 󱀍
    TypeAlias = "󰌷", --  󰌷
    TypeParameter = "󰘮", --  
    ------ U ------
    Unit = "󰑭", -- 󰉺
    ------ V ------
    Value = "󰭷", --  󰀫 󰭸 󰈚 󰈚
    Variable = "󰫧", --   󰫧 󰀫
    ------ W ------
    ------ X ------
    ------ Y ------
  },
  git = {
    -- Branch = "",
    Branch = "",
    BoldLineAdd = "󰐖", -- 
    LineAdded = "󰜄", -- 
    BoldLineModified = "󱗜", -- nf-md-circle_box
    LineModified = "󱗝", -- nf-md-circle_box_outline -- 
    BoldLineRemove = "󰍵", -- 
    LineRemoved = "󰛲", -- 
    Octoface = "", --eb27
    FileDeleted = "󰛲", -- 
    FileIgnored = "󰿠", --   󱋯
    -- FileIgnored = "",
    FileRenamed = "󰜶",
    FileUntracked = "󰋖",
    FileUnstaged = "󰄱", -- 
    FileStaged = "󰄵",
    FileUnmerged = "󰘭", -- 󰘭 
    Diff = "󰦒", --  󰆕
    Repo = "󰳏", -- 
  },
  diagnostic = {
    Error = "󰅙", -- 
    ErrorOutline = "󰅚", --
    Warning = "󰀦", --   󰀨
    WarningOutline = "󰀪", -- 
    Information = "󰋼",
    InformationOutline = "󰋽",
    Question = "󰮥", --  󰋗
    QuestionOutline = "󰮦", --  󰘥
    Hint = "󰌵",
    HintOutline = "󰌶", -- 
    Debug = "󰃤",
    Trace = "󰏫", -- ✎
  },
  ui = {
    ------ A ------
    Adjust = "󰀚",
    ArrowRight = "󰁔",
    ArrowUpCircle = "󰁟",
    ArrowRightCircle = "󰁖",
    ArrowDownCircle = "󰁇",
    ArrowLeftCircle = "󰁏",
    ArrowUpBold = "󰜷",
    ArrowRightBold = "󰜴", -- 
    ArrowDownBold = "󰜮",
    ArrowLeftBold = "󰜱",
    ------ B ------
    BookMark = "󰃀",
    Bug = "󰃤", -- 
    ------ C ------
    Calendar = "󰃭",
    CameraTimer = "󰄉",
    Check = "󰄬",
    CheckBold = "󰸞",
    CheckboxMarked = "󰄲",
    CheckboxMarkedCircle = "󰄴",
    CheckboxMarkedOutline = "󰄵", -- 
    CheckCircleOutline = "󰗡",
    CheckCircle = "󰗠",
    ChevronUp = "󰅃", -- 
    ChevronDown = "󰅀", -- 
    ChevronRight = "󰅂", -- 
    ChevronLeft = "󰅁", -- 
    ChevronUpDouble = "󰄿", -- »
    ChevronDownDouble = "󰄼", -- »
    ChevronLeftDouble = "󰄽", -- »
    ChevronRightDouble = "󰄾", -- »
    ChevronUpTriple = "󰶼",
    ChevronDownTriple = "󰶹",
    ChevronLeftTriple = "󰶺",
    ChevronRightTriple = "󰶻",
    CircleBig = "",
    Clock = "󰥔",
    Close = "󰅖",
    CloseTick = "󱎘",
    CloudCheck = "󰅠",
    CloudOff = "󰅤",
    Code = "󰗀", -- 
    Code2 = "",
    Code3 = "",
    Comment = "󰅺",
    ------ D ------
    Dashboard = "󰕮",
    DebugConsole = "",
    DividerRight = "",
    DividerLeft = "",
    DividerRightBold = "",
    DividerLeftBold = "",
    Dot = "", -- ●
    ------ E ------
    Ellipsis = "󰇘",
    ------ F ------
    File = "󰈔", -- nf-md-file
    FilePlus = "󰝒",
    Files = "󰈢", -- nf-md-file_multiple
    FileSymlink = "󰪹", -- nf-md-file-link_outline
    Filter = "󰈲",
    FindFile = "󰈞", -- nf-md-file_find
    FindText = "󰊄", -- nf-md-format_text
    Fire = "󰈸",
    Folder = "󰉋", -- nf-md-folder
    FolderMultiple = "󰉓",
    FolderOpen = "󰝰", -- nf-md-folder_open
    FolderOpenEmpty = "󰷏", -- nf-md-folder_open_outline
    FolderOutline = "󰉖", -- nf-md-folder_outline
    FolderSymlink = "󱧮", -- nf-md_folder_pound -- 
    Forward = "󱞬", -- 
    ------ G ------
    Gear = "󰒓",
    ------ H ------
    ------ I ------
    ------ J ------
    ------ K ------
    ------ L ------
    Lightbulb = "󰌵",
    LineLeft = "▏",
    LineMiddle = "│",
    LineLeftBold = "▎",
    List = "󰷐",
    Lock = "󰌾", -- 
    LockOpen = "󰌿",
    LockOutline = "󰍁",
    -- LspActive = "󰊲",
    LspActive = "",
    LspInactive = "󰊱",
    ------ M ------
    MenuUp = "󰍠", -- 
    MenuRight = "󰍟", --
    MenuLeft = "󰍞", --
    MenuDown = "󰍝", --
    ------ N ------
    Note = "󰎞",
    ------ O ------
    ------ P ------
    Package = "󰏓",
    Pencil = "󰏫",
    Pending = "󰊳",
    Plus = "󰐕",
    Plus2 = "󰙞",
    Project = "󰂺",
    ------ Q ------
    Question = "󰋖",
    ------ R ------
    Restore = "󰁯",
    Run = "󰜎",
    RunError = "",
    ------ S ------
    Scopes = "",
    Search = "󰍉",
    Session = "󰙰",
    SessionIn = "󰘽",
    -- SessionIn = "󰘾",
    SessionOut = "󰘻",
    -- SessionOut = "󰘼",
    SignIn = "󰍂",
    SignOut = "󰍃",
    Space = "•",
    Square = "󰝤",
    SquareMedium = "󰨓", -- nf-md-square_medium
    SquareSmall = "󰨕",
    Stacks = " ",
    ------ T ------
    Tab = "󰌒",
    Table = "󰓫",
    Target = "󰀘",
    Text = "󰭷", -- 󰭷 󰈚
    TextMultiple = "󰪷",
    Tree = "󰐅",
    Triangle = "󰐊",
    ------ U ------
    ------ V ------
    ------ W ------
    Watches = "󰂥",
    WindowRestore = "󰖲",
    ------ X ------
    ------ Y ------
    ------ Z ------
  },
  misc = {
    -- Neovim = '',
    Neovim = "",
    Robot = "󱚝", -- 󰚩
    Squirrel = "",
    Tag = "󰓹",
    Watch = "",
    Smiley = "󰞅",
    Package = "󰆦",
    CircuitBoard = "󱤓",
    Github = "󰊤",
    Bash = "󱆃", -- 
    Lua = "󰢱",
    Keyboard = "󰌌",
    KeyboardVariant = "󰌓",
    Shell = "❯",
    Telescope = "",
  },
}

local fmt = string.format

function M.findKind(name, suffix)
  local icon = M.kind[name]
  if icon == nil then
    vim.print(fmt("No Kind `%s` icon", name))
    return nil
  end
  return suffix and icon .. suffix or icon
end

-- M.kinds = function(suffix, ...)
-- local kindTable = {}
-- for _, v in ipairs({ ... }) do
--   kindTable[v] = M.findKind(v, suffix)
-- end
-- return kindTable
-- end
--
function M.kinds(suffix)
  local kinds = {}
  for k, v in pairs(M.kind) do
    kinds[k] = suffix and v .. suffix or v
  end
  return kinds
end

return M
