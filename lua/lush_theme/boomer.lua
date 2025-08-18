local light = false

local lush = require("lush")
local hsluv = lush.hsluv

local bg     = hsluv(290, 40, 5)
local fg     = bg.li(100).de(80)
local white  = fg.li(80)
local yellow = hsluv( 55,  90, 85)
local beige  = hsluv( 65,  80, 93)
local orange = hsluv( 18,  95, 75)
local purple = hsluv(270,  100, 75)
local pink   = hsluv(300,  90, 85)
local cyan   = hsluv(170,  60, 85)
local green  = hsluv(90,  90, 85)
local blue   = hsluv(250,  70, 75)
local red    = hsluv( 10,  80, 60)

local bg_light = fg
local fg_light = bg
local white_light = white.da(40)
local yellow_light = yellow.da(40)
local orange_light = orange.da(40)
local purple_light = purple.da(40)
local cyan_light = cyan.da(40)
local green_light = green.da(40)
local blue_light = blue.da(40)
local red_light = red.da(40)

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
    WhiteFg        { fg = white },
    YellowFg       { fg = yellow },
    OrangeFg       { fg = orange },
    PurpleFg       { fg = purple },
    CyanFg         { fg = cyan },
    GreenFg        { fg = green },
    BlueFg         { fg = blue },
    RedFg          { fg = red },

    WhiteBg        { fg = bg, bg = white, bold = true },
    YellowBg       { fg = bg, bg = yellow, bold = true },
    OrangeBg       { fg = bg, bg = orange, bold = true },
    PurpleBg       { fg = bg, bg = purple, bold = true },
    CyanBg         { fg = bg, bg = cyan, bold = true },
    GreenBg        { fg = bg, bg = green, bold = true },
    BlueBg         { fg = bg, bg = blue, bold = true },
    RedBg          { fg = bg, bg = red, bold = true },

    Cursor         { fg = blue.da(10), bg = white, bold = true },
    Visual         { bg = blue.da(60) },
    MultiCursorCursor { bg = Visual.bg.li(30).de(20) },
    MultiCursorVisual { bg = Visual.bg.da(25) },
    CursorLine     { bg = bg.li(10).ro(-15) },
    SignColumn     { bg = bg.li(10) },
    NonText        { fg = bg.li(40).de(60) },
    LineNr         { fg = bg.li(50).de(80) },
    CursorLineNr   { fg = fg },
    CursorLineSign { fg = fg },
    Normal         { fg = fg, bg = bg },
    NormalFloat    { bg = bg.da(50) },
    FloatBorder    { fg = NormalFloat.bg, bg = NormalFloat.bg },
    -- FloatBorder    { fg = fg.da(50).sa(10), bg = NormalFloat.bg },
    -- FloatBorder    { fg = Normal.fg },
    FloatTitle     { fg = FloatBorder.fg.li(80), bg = NormalFloat.bg, bold = true },
    StatusLine     { fg = fg.da(20).sa(40), bg = bg.li(30).de(30) },
    StatusLineBold { bg = StatusLine.bg, fg = StatusLine.fg, bold = true },
    StatusLineNC   { bg = StatusLine.bg, fg = StatusLine.fg },
    StatusLineHidden { fg = StatusLine.bg, bg = StatusLine.bg },
    Tabline        { fg = bg.li(20).de(30), bg = StatusLineNC.bg },
    TablineSel     { bg = bg, fg = fg },
    WinSeparator   { fg = bg.li(40) },
    VertSplit      { WinSeparator },
    EndOfBuffer    { NonText },
    Pmenu          { bg = bg.li(20) },
    PmenuSel       { bg = bg.li(10) },
    PmenuSbar      { bg = Pmenu.bg.da(20).sa(20) },
    PmenuThumb     { bg = Pmenu.bg.li(20).de(20) },
    QuickFixLine   { CursorLine },
    Folded         { bg = bg.li(10).de(10) },

    DiagnosticInfo         { fg = blue },
    DiagnosticFloatingInfo { fg = DiagnosticInfo.fg, bg = NormalFloat.bg },
    DiagnosticWarn         { fg = yellow },
    DiagnosticFloatingWarn { fg = DiagnosticWarn.fg, bg = NormalFloat.bg },
    DiagnosticUnnecessary { fg = fg.da(40).de(40) },

    -- Git
    DiffAdd        { fg = green, bg = green.da(70).de(60) },
    DiffDelete     { fg = red, bg = red.da(70).de(60) },
    DiffText       { fg = blue, bg = blue.da(70).de(60) },
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
    Operator       { Punctuation },
    Keyword        { fg = fg },
    Special        { fg = orange },
    PreProc        { Special },
    Identifier     { fg = fg },
    Statement      { Keyword },
    Type           { Keyword },
    Directory      { fg = blue },
    Comment        { fg = fg.da(40) },

    LspInlayHint { fg = Comment.fg, bg = bg.li(10) },

    sym"@variable"              { fg = fg },
    sym"@comment"               { Comment },

    Constant               { fg = purple },
    sym"@constant"         { Constant },

    Property { fg = pink },
    sym"@property" { Property },

    String                 { fg = green },
    Number                 { String },

    Namespace                 { fg = beige },
    sym"@type.qmljs"          { Namespace },

    Structural                { fg = orange },
    Tag                       { Structural },
    sym"@type"                { Structural },
    sym"@keyword"             { Structural },
    sym"@keyword.type"        { Structural },

    Builtin                   { fg = purple },
    sym"@keyword.import"      { Builtin },
    sym"@function.builtin"    { Builtin },
    sym"@module.builtin"      { Builtin },
    sym"@constant.builtin"    { Builtin },

    HiddenFlow                { fg = yellow },
    Function                  { HiddenFlow },
    sym"@function.call"       { HiddenFlow },

    ControlFlow               { fg = red },
    sym"@keyword.repeat"      { ControlFlow },
    sym"@keyword.conditional" { ControlFlow },
    sym"@keyword.return"      { ControlFlow },
    sym"@keyword.operator"    { ControlFlow },
    sym"@keyword.coroutine"   { ControlFlow },
    sym"@operator.fennel"            { ControlFlow },

    sym"@constructor"     { Type },
    sym"@constructor.lua" { Delimiter },

    -- Plugins
    Patrick      { fg = red.sa(100).ro(-10), bold = true },

    MiniPickNormal { fg = fg, bg = bg },
    MiniPickBorder { StatusLine },
    MiniPickBorderText { StatusLine },
    MiniPickPrompt { fg = StatusLine.fg, bg = StatusLine.bg, bold = true },
    MiniPickPromptPrefix { fg = bg.li(40), bg = MiniPickPrompt.bg, bold = true },
    MiniPickPromptCaret { fg = Cursor.bg },

    MiniIconsGrey   { fg = white.da(20) },
    MiniIconsYellow { fg = yellow },
    MiniIconsOrange { fg = orange },
    MiniIconsPurple { fg = purple },
    MiniIconsCyan   { fg = cyan },
    MiniIconsGreen  { fg = green },
    MiniIconsAzure  { fg = blue.sa(70).ro(20) },
    MiniIconsBlue   { fg = blue },
    MiniIconsRed    { fg = red },
  }
end)

return theme
