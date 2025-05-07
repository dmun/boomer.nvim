local lush = require("lush")
local hsluv = lush.hsluv

local bg = hsluv(220, 80, 8)
local fg = hsluv(220, 50, 100)
local white = fg.li(80)
local pink   = hsluv(340, 90, 70)
local purple = hsluv(320, 50, 80)
local blue   = hsluv(240, 90, 80)
local cyan   = hsluv(200, 60, 75)
local green  = hsluv(100, 80, 90)
local yellow = hsluv(65, 90, 88)
local orange = hsluv(35, 90, 75)
local red    = hsluv(10, 90, 65)

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
    LineNr         { fg = bg.li(40).de(40) },
    CursorLineNr   { fg = Cursor.bg },
    -- CursorLineSign { bg = bg.li(5).de(10) },
    Visual         { bg = bg.li(20).de(20) },
    Normal         { fg = fg, bg = bg },
    NormalFloat    { bg = bg.da(40).de(10) },
    -- NormalFloat    {},
    -- NormalAlt      { bg = bg.da(40).de(10) },
    FloatBorder    { fg = fg.da(40).de(30), bg = NormalFloat.bg },
    FloatTitle     { fg = FloatBorder.fg.li(80), bg = NormalFloat.bg, bold = true },
    StatusLine     { bg = bg.da(40).de(20), fg = fg },
    StatusLineNC   { StatusLine },
    -- StatusLineNC   { bg = bg.da(20), fg = fg.da(20).de(20) },
    Tabline        { fg = bg, bg = StatusLineNC.bg },
    TablineSel     { bg = bg, fg = fg },
    WinSeparator   { FloatBorder },
    Pmenu          { bg = bg.da(30) },
    PmenuSel       { bg = Pmenu.bg.li(18).sa(20) },
    PmenuSbar      { bg = Pmenu.bg.da(20) },
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
    Delimiter      { fg = fg },
    Punctuation    { fg = fg },
    Keyword        { fg = cyan },
    Operator       { fg = fg },
    Special        { fg = white },
    Constant       { fg = orange },
    Number         { Constant },
    PreProc        { Constant },
    String         { fg = green },
    Identifier     { fg = white },
    Function       { fg = yellow },
    Statement      { Keyword },
    Type           { fg = orange },
    Directory      { fg = blue },
    Comment        { fg = fg.da(40).de(40) },
    Conditional    { fg = orange },

    sym"@variable"          { Identifier },
    sym"@variable.member"   { Identifier },
    sym"@lsp.type.modifier" { fg = red },
    sym"@keyword.modifier"  { fg = red },
    sym"@keyword.operator"  { Conditional },
    sym"@keyword.conditional" { Conditional },
    sym"@keyword.repeat"    { Conditional },
    sym"@type"              { Type },
    sym"@constructor"       { Type },
    sym"@constructor.lua"   { Delimiter },
    sym"@type.builtin"      { Keyword },
    sym"@function"          { Function },
    sym"@function.builtin"  { Function },
    sym"@character"         { fg = red },
    sym"@string.tsx"        { fg = blue },
    Tag                     { fg = green },
    -- sym"@tag"               { Keyword },
    sym"@tag.builtin"       { Tag },
    sym"@tag.attribute"     { fg = Tag.fg.de(40).li(20) },
    sym"@tag.delimiter"     { Delimiter },
    sym"@markup.heading.markdown"    { fg = red },

    -- Plugins
    CopilotSuggestion { fg = bg.li(50).de(50) },

    BlinkCmpSignatureHelp       { Pmenu },
    BlinkCmpSignatureHelpBorder { Pmenu },

    TreesitterContext { CursorLine },

    IlluminatedWordRead  { bg = CursorLine.bg.li(5).de(5)},
    IlluminatedWordText  { bg = CursorLine.bg.li(5).de(5)},
    IlluminatedWordWrite { bg = CursorLine.bg.li(5).de(5)},

    -- FzfLuaBorder            { StatusLine },
    -- FzfLuaTitle             { fg = blue, bg = StatusLine.bg },

    -- stylua: ignore end
  }
end)

return theme
