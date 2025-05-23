local light = false

local lush = require("lush")
local hsluv = lush.hsluv

local bg = hsluv(245, 70, 7)
local fg = hsluv(220, 20, 99)
local white = fg.li(80)
local yellow = hsluv(65, 90, 86)
local orange = hsluv(50, 80, 80)
local purple = hsluv(275, 90, 75)
local cyan = hsluv(140, 80, 90)
local green = hsluv(110, 70, 90)
local blue = hsluv(230, 90, 80)
local red = hsluv(5, 90, 60)

local bg_light = hsluv(240, 30, 100)
local fg_light = hsluv(220, 20, 0)
local white_light = fg.da(80)
local yellow_light = hsluv(65, 90, 58)
local orange_light = hsluv(40, 90, 45)
local purple_light = hsluv(330, 50, 45)
local cyan_light = hsluv(160, 70, 45)
local green_light = hsluv(100, 80, 45)
local blue_light = hsluv(240, 90, 40)
local red_light = hsluv(10, 90, 40)

if light then
  bg = bg_light
  fg = fg_light
  white = white_light
  yellow = yellow_light
  orange = orange_light
  purple = purple_light
  cyan = cyan_light
  green = green_light
  blue = blue_light
  red = red_light
end

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

    RainbowDelimiterYellow       { fg = yellow.da(10).sa(60) },
    RainbowDelimiterOrange       { fg = orange.da(10).sa(60) },
    RainbowDelimiterViolet       { fg = purple.da(10).sa(60) },
    RainbowDelimiterCyan         { fg = cyan.da(10).sa(60) },
    RainbowDelimiterGreen        { fg = green.da(10).sa(60) },
    RainbowDelimiterBlue         { fg = blue.da(10).sa(60) },
    RainbowDelimiterRed          { fg = red.da(10).sa(60) },

    Cursor         { bg = white.da(10).de(10) },
    MultiCursorCursor { bg = white.da(40).sa(40) },
    CursorLine     { bg = bg.li(5).de(10) },
    LineNr         { fg = bg.li(20).de(20) },
    CursorLineNr   { fg = Cursor.bg },
    NonText        { fg = bg.li(10).de(10) },
    -- CursorLineSign { bg = bg.li(5).de(10) },
    Visual         { bg = bg.li(20).de(20) },
    Normal         { fg = fg, bg = bg },
    NormalFloat    { bg = bg.da(40).de(10) },
    FloatBorder    { fg = fg.da(40).sa(10), bg = NormalFloat.bg },
    -- FloatBorder    { fg = Normal.bg, bg = NormalFloat.bg },
    FloatTitle     { fg = FloatBorder.fg.li(50), bg = NormalFloat.bg },
    StatusLine     { bg = bg.da(40).de(10), fg = fg.da(20).de(20) },
    StatusLineNC   { StatusLine },
    Tabline        { fg = fg.da(30).de(30), bg = StatusLineNC.bg },
    TablineSel     { bg = bg, fg = fg },
    WinSeparator   { fg = "NONE", bg = bg.da(40) },
    VertSplit      { WinSeparator },
    SignColumn     { bg = Normal.bg },
    EndOfBuffer    { fg = bg.li(10).de(10) },
    Pmenu          { bg = bg.li(10) },
    PmenuSel       { bg = bg.li(25).sa(20) },
    PmenuSbar      { bg = Pmenu.bg.da(20).sa(20) },
    PmenuThumb     { bg = Pmenu.bg.li(20).de(20) },
    QuickFixLine   { PmenuSel },
    Folded         { bg = bg.li(10).de(10) },

    DiagnosticInfo { fg = blue.li(20).de(20) },
    DiagnosticFloatingInfo { fg = blue.li(20).de(20), bg = NormalFloat.bg },
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
    Delimiter      { fg = fg.da(0).de(20) },
    Punctuation    { fg = fg },
    Keyword        { fg = red },
    Operator       { Normal },
    Special        { fg = white },
    Constant       { fg = yellow },
    Number         { Constant },
    PreProc        { Constant },
    String         { fg = green },
    Identifier     { fg = fg },
    Function       { fg = orange },
    Statement      { Keyword },
    Type           { fg = orange },
    Tag            { fg = cyan },
    Directory      { fg = blue },
    Comment        { fg = fg.da(40) },

    sym"@variable"          { fg = fg },
    sym"@variable.member"   { fg = fg },
    sym"@lsp.type.modifier" { fg = red },
    sym"@keyword.modifier"  { fg = red },
    sym"@none"              { Delimiter },
    sym"@type"              { Type },
    sym"@constructor"       { Type },
    sym"@constructor.lua"   { Delimiter },
    sym"@type.builtin"      { Keyword },
    sym"@function"          { Function },
    sym"@function.builtin"  { Function },
    sym"@character"         { fg = red },
    sym"@tag"               { Tag },
    sym"@tag.builtin"       { Tag },
    sym"@tag.attribute"     { Delimiter },
    sym"@tag.delimiter"     { Delimiter },
    sym"@markup.heading"    {},
    sym"@markup.heading.markdown"  { fg = red },
    -- sym"@function.builtin"  { fg = Keyword.fg.ro(20).de(10) },

    -- sym"@keyword.coroutine.svelte"   { fg = red },
    -- sym"@keyword.conditional.svelte" { fg = red },
    -- sym"@keyword.repeat.svelte"      { fg = red },

    -- Plugins
    CopilotSuggestion { fg = bg.li(50).de(50) },

    BlinkCmpDocBorder           { FloatBorder },
    BlinkCmpDocSeparatorBorder  { FloatBorder },
    BlinkCmpSignatureHelp       { NormalFloat },
    BlinkCmpSignatureHelpBorder { FloatBorder },

    TreesitterContext { CursorLine },

    IlluminatedWordRead  { bg = CursorLine.bg.li(5).de(5)},
    IlluminatedWordText  { bg = CursorLine.bg.li(5).de(5)},
    IlluminatedWordWrite { bg = CursorLine.bg.li(5).de(5)},

    fugitiveHunk { fg = fg.da(30) },

    -- stylua: ignore end
  }
end)

return theme
