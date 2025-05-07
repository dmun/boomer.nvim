local lush = require("lush")
local hsluv = lush.hsluv

local bg = hsluv(240, 30, 16)
local fg = hsluv(220, 20, 99)
local white = fg.li(80)
local yellow = hsluv(65, 90, 88)
local orange = hsluv(40, 90, 75)
local purple = hsluv(300, 50, 75)
local cyan = hsluv(160, 70, 75)
local green = hsluv(100, 80, 85)
local blue = hsluv(240, 90, 75)
local red = hsluv(10, 90, 60)

---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- stylua: ignore start
    WhiteFg        { fg = white },
    YellowFg       { fg = yellow },
    OrangeFg       { fg = orange },
    PurpleFg       { fg = purple },
    CyanFg         { fg = cyan },
    GreenFg        { fg = green },
    BlueFg         { fg = blue },
    RedFg          { fg = red },

    Cursor         { bg = white.da(20).de(20) },
    CursorLine     { bg = bg.li(5).de(10) },
    LineNr         { fg = bg.li(15).de(20) },
    CursorLineNr   { fg = Cursor.bg },
    -- CursorLineSign { bg = bg.li(5).de(10) },
    Visual         { bg = bg.li(20).de(20) },
    Normal         { fg = fg, bg = bg },
    NormalFloat    { bg = bg.da(40).de(10) },
    FloatBorder    { fg = fg.da(30).de(30), bg = NormalFloat.bg },
    FloatTitle     { fg = FloatBorder.fg.li(30), bg = NormalFloat.bg },
    StatusLine     { bg = bg.da(40).de(10), fg = fg },
    StatusLineNC   { bg = bg.da(20), fg = fg.da(20).de(20) },
    Tabline        { fg = bg, bg = StatusLineNC.bg },
    TablineSel     { bg = bg, fg = fg },
    WinSeparator   { FloatBorder },
    Pmenu          { bg = bg.li(20).de(40) },
    PmenuSel       { bg = blue.da(60).sa(60) },
    PmenuSbar      { bg = Pmenu.bg.da(20).sa(20) },
    PmenuThumb     { bg = Pmenu.bg.li(20).de(20) },
    QuickFixLine   { PmenuSel },
    DiagnosticInfo { fg = blue.li(20).de(20) },
    Folded         { bg = bg.li(10).de(10) },
    DiagnosticUnnecessary { fg = fg.da(40).de(40) },

    -- Git
    DiffAdd        { fg = green, bg = green.da(50).de(50) },
    DiffDelete     { fg = red, bg = red.da(50).de(50) },
    DiffText       { fg = blue, bg = blue.da(50).de(50) },
    DiffChange     { fg = DiffText.fg, bg = bg.li(10) },
    diffAdded      { DiffAdd },
    diffRemoved    { DiffDelete },
    diffLine       { DiffText },
    Added          { fg = green },
    Changed        { fg = yellow },
    Removed        { fg = red },

    -- Syntax
    Delimiter      { fg = fg.da(20).de(80) },
    Punctuation    { fg = fg },
    Keyword        { fg = purple },
    Operator       { Keyword },
    Special        { fg = white },
    Constant       { fg = yellow },
    Number         { Constant },
    PreProc        { Constant },
    String         { fg = green },
    Identifier     { fg = fg },
    Function       { fg = blue },
    Statement      { Keyword },
    Type           { fg = yellow },
    Directory      { fg = blue },
    Comment        { fg = cyan },

    sym"@variable" { fg = fg },
    sym"@lsp.type.modifier" { fg = red },
    sym"@keyword.modifier"  { fg = red },
    sym"@type"              { Type },
    sym"@constructor"       { Type },
    sym"@constructor.lua"   { Delimiter },
    sym"@type.builtin"      { Keyword },
    sym"@function"          { Function },
    sym"@function.builtin"  { Keyword },
    sym"@character"         { fg = red },
    sym"@tag"               { Constant },
    sym"@tag.builtin"       { Keyword },
    sym"@tag.delimiter"     { Delimiter },
    sym"@markup.heading.markdown"    { fg = red },
    -- sym"@function.builtin"  { fg = Keyword.fg.ro(20).de(10) },

    -- Plugins
    CopilotSuggestion { fg = bg.li(50).de(50) },

    BlinkCmpSignatureHelp       { Pmenu },
    BlinkCmpSignatureHelpBorder { Pmenu },

    TreesitterContext { CursorLine },

    IlluminatedWordRead  { bg = CursorLine.bg.li(5).de(5)},
    IlluminatedWordText  { bg = CursorLine.bg.li(5).de(5)},
    IlluminatedWordWrite { bg = CursorLine.bg.li(5).de(5)},

    -- stylua: ignore end
  }
end)

return theme
