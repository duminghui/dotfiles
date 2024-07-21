local M = {
  kind = {
    --
    Array = '󰅪', -- 󰅪 󰅨
    Boolean = '󰔡', -- 󰔡 󰨚
    Class = '󰌨', -- 󰌗 󰙅  EA4A
    Color = '󰏘', --
    Constant = '󰕶', -- 󰇽 󰏿
    Constructor = '󱀥', -- 󰆧 󰆦
    Enum = '󰷐', --   󰷐
    EnumMember = '󰍴', --   EA55
    Event = '󰉁', -- 󱐋
    Field = '', --   󰆧
    File = '󰈔', -- 󰈙 󰈔 󰈤
    Folder = '󰝰', -- 󰝰 󰉋
    Function = '󰡱', -- 󰊕 ƒ
    Interface = '󰀽', -- 󰀽 󰀿
    Key = '󱀍', -- 󰉿
    Keyword = '󰌆', -- 󰉨
    Macro = '󰐣', -- 󰬔
    Method = '󰊕', -- 󰡱 EA03
    Misc = '󰠱', -- #
    Module = '󰘦', -- 
    Namespace = '󰘦', -- 󰅩
    Null = '󰟢', --
    Number = '󰎠', --
    Numeric = '󰎠', --
    Object = '󰘦', -- 󰅩 󰙅 󰆩
    Operator = '', -- 󰆕 󰦒
    Package = '󰘦', -- 󰏗 󰏓
    Parameter = '󰘮', -- 
    Property = '󰖷', -- 󰄻 󰓹 󰖷 󰆧
    Reference = '󰌹', -- 󰈇 󱞬 󰌷 󰌹
    Ruler = '󰑭', --
    Snippet = '󰃐', -- 󰆒 󰌲 󰃐 󰗀 󱓡 󱓠 󰅌 󰆒
    StaticMethod = '󰊕', --
    String = '󰀬', -- 󰉿 󰀬 󱀍
    Struct = '󰆩', -- 󰆩  󰠱
    Structure = '󰆩', --
    Text = '󰀬', -- 󰊄  󰭷 󰦩 󰦨 󱀍
    TypeAlias = '󰌷', --  󰌷
    TypeParameter = '󰘮', --  
    Unit = '󰑭', -- 󰉺
    Value = '󰈚', --  󰀫 󰭸 󰈚
    Variable = '󰫧', --   󰫧 󰀫
  },
  git = {
    -- Branch = "",
    Branch = '',
    BoldLineAdd = '󰐖', -- 
    LineAdded = '󰜄', -- 
    BoldLineModified = '󱗜', -- nf-md-circle_box
    LineModified = '󱗝', -- nf-md-circle_box_outline -- 
    BoldLineRemove = '󰍵', -- 
    LineRemoved = '󰛲', -- 
    Octoface = '', --eb27
    FileDeleted = '󰛲', -- 
    FileIgnored = '󰿠', --   󱋯
    -- FileIgnored = "",
    FileRenamed = '󰜶',
    FileUntracked = '󰋖',
    FileUnstaged = '󰄱', -- 
    FileStaged = '󰄵',
    FileUnmerged = '󰘭', -- 󰘭 
    Diff = '󰦒', --  󰆕
    Repo = '󰳏', -- 
  },
  diagnostics = {
    BoldError = '󰅙', -- 
    Error = '󰅚', --
    BoldWarning = '󰀦', --  
    Warning = '󰀪', -- 
    BoldInformation = '󰋼',
    Information = '󰋽',
    BoleQuestion = '󰮥', --  󰋗
    Question = '󰮦', --  󰘥
    BoldHint = '󰌵',
    Hint = '󰌶',
    Debug = '󰃤',
    Trace = '✎',
  },
  ui = {
    ArrowRight = '󰁔',
    ArrowCircleDown = '󰁇',
    ArrowCircleLeft = '󰁏',
    ArrowCircleRight = '󰁖',
    ArrowCircleUp = '󰁟',
    BoldArrowDown = '󰜮',
    BoldArrowLeft = '󰜱',
    BoldArrowRight = '󰜴', -- 
    BoldArrowUp = '󰜷',
    BoldClose = '󱎘',
    BoldDividerLeft = '',
    BoldDividerRight = '',
    BoldLineLeft = '▎',
    BookMark = '󰃀',
    BoxChecked = '󰄵', -- 
    Bug = '󰃤', -- 
    Stacks = ' ',
    Scopes = '',
    Watches = '󰂥',
    DebugConsole = '',
    Calendar = '󰃭',
    Check = '󰄬',
    ChevronRight = '>',
    ChevronDoubleRight = '󰄾', -- »
    ChevronTripleRight = '󰶻',
    ChevronShortDown = '󰅀', -- 
    ChevronShortLeft = '󰅁', -- 
    ChevronShortRight = '󰅂', -- 
    ChevronShortUp = '󰅃', -- 
    PrimitiveDot = '', -- ●
    CircleBig = '',
    CircleCheck = '󰄴',
    CircleCheck2 = '󰗡',
    BoldCircleCheck = '󰗠',
    Close = '󰅖',
    CloudCheck = '󰅠',
    CloudOff = '󰅤',
    Code = '󰗀', -- 
    Code2 = '',
    Code3 = '',
    Comment = '󰅺',
    Dashboard = '󰕮',
    DividerLeft = '',
    DividerRight = '',
    Ellipsis = '',
    EmptyFolder = '󰉖', -- nf-md-folder_outline
    EmptyFolderOpen = '󰷏', -- nf-md-folder_open_outline
    File = '󰈔', -- nf-md-file
    FileSymlink = '󰪹', -- nf-md-file-link_outline
    Files = '󰈢', -- nf-md-file_multiple
    Filter = '󰈲',
    FindFile = '󰈞', -- nf-md-file_find
    FindText = '󰊄', -- nf-md-format_text
    Fire = '',
    Folder = '󰉋', -- nf-md-folder
    FolderOpen = '󰝰', -- nf-md-folder_open
    FolderMultiple = '󰉓',
    FolderSymlink = '󱧮', -- nf-md_folder_pound -- 
    Forward = '󱞬', -- 
    Gear = '󰒓',
    History = '󰄉',
    Lightbulb = '󰌵',
    LineLeft = '▏',
    LineMiddle = '│',
    List = '󰷐',
    Lock = '󰍁',
    Lock2 = '󰌾', -- 
    LockOpen = '󰌿',
    -- LspActive = "󰊲",
    LspActive = '',
    LspInactive = '󰊱',
    NewFile = '󰝒',
    Note = '󰎞',
    Package = '󰏓',
    Pencil = '󰏫',
    Pending = '󰊳',
    Plus = '󰐕',
    Plus2 = '󰙞',
    Project = '󰂺',
    Run = '󰜎',
    RunError = '',
    Search = '󰍉',
    Session = '󰙰',
    Session2 = '󰁯',
    SessionIn = '󰘽',
    -- SessionIn = "󰘾",
    SessionOut = '󰘻',
    -- SessionOut = "󰘼",
    SignIn = '󰍂',
    SignOut = '󰍃',
    Square = '󰝤',
    SquareMedium = '󰨓', -- nf-md-square_medium
    SquareSmall = '󰨕',
    SquareCheck = '󰄲',
    Space = '•',
    Tab = '󰌒',
    Table = '󰓫',
    Target = '󰀘',
    Telescope = '',
    Text = '󰈚',
    TextMultiple = '󰪷',
    Tree = '󰐅',
    Triangle = '󰐊',
    TriangleShortArrowDown = '',
    TriangleShortArrowLeft = '',
    TriangleShortArrowRight = '',
    TriangleShortArrowUp = '',
  },
  misc = {
    -- Neovim = '',
    Neovim = '',
    Robot = '󱚝', -- 󰚩
    Squirrel = '',
    Tag = '󰓹',
    Watch = '',
    Smiley = '󰞅',
    Package = '󰆦',
    CircuitBoard = '󱤓',
  },
}

local Log = require('xxx.core.log')
local fmt = string.format

M.findKind = function(name, suffix)
  local icon = M.kind[name]
  if icon == nil then
    Log:error(fmt('No Kind `%s` icon', name))
    return nil
  end
  if suffix == nil then
    return icon
  end
  return icon .. suffix
end

M.kindTable = function(suffix, ...)
  local kindTable = {}
  for _, v in ipairs { ... } do
    kindTable[v] = M.findKind(v, suffix)
  end
  return kindTable
end

return M
