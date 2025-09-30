local light = false

local lush = require("lush")
local hsluv = lush.hsluv

local bg     = hsluv(220, 40, 12)
local fg     = bg.li(100).de(100)
local white  = fg.li(80)
local yellow = hsluv( 55,  100, 83)
local beige  = hsluv( 65,  80, 93)
local orange = hsluv( 18,  95, 65)
local purple = hsluv(270,  100, 85)
local pink   = hsluv(300,  90, 80)
local cyan   = hsluv(170,  60, 85)
local green  = hsluv(90,  95, 88)
local blue   = hsluv(250,  90, 77)
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
    SignColumn     { bg = bg },
    NonText        { fg = bg.li(30).de(80) },
    LineNr         { fg = bg.li(50).de(80) },
    CursorLineNr   { fg = fg },
    CursorLineSign { fg = fg },
    Normal         { fg = fg, bg = bg },
    MsgArea        { bg = Normal.bg.da(20) },
    NormalFloat    { bg = bg.da(50) },
    -- FloatBorder    { fg = NormalFloat.bg, bg = NormalFloat.bg },
    -- FloatBorder    { fg = fg.da(50).sa(10), bg = NormalFloat.bg },
    FloatBorder    { fg = Normal.fg },
    -- FloatTitle     { fg = FloatBorder.fg.li(80), bg = NormalFloat.bg, bold = true },
    FloatTitle     { fg = FloatBorder.fg.li(80), bold = true },
    StatusLine     { fg = fg.da(20).sa(20), bg = bg.da(40).de(40) },
    StatusLineBold { bg = StatusLine.bg, fg = StatusLine.fg, bold = true },
    StatusLineNC   { bg = StatusLine.bg, fg = StatusLine.fg },
    StatusLineHidden { fg = StatusLine.bg, bg = StatusLine.bg },
    Tabline        { fg = fg.da(30), bg = StatusLine.bg },
    TablineSel     { bg = blue.da(70), bold = true },
    WinSeparator   { fg = bg.li(40) },
    VertSplit      { WinSeparator },
    EndOfBuffer    { NonText },
    Pmenu          { bg = bg.li(20) },
    PmenuSel       { bg = bg.li(10) },
    PmenuSbar      { bg = Pmenu.bg.da(20).sa(20) },
    PmenuThumb     { bg = Pmenu.bg.li(20).de(20) },
    QuickFixLine   { CursorLine },
    Folded         { bg = bg },

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
    Special        { fg = pink },
    PreProc        { Special },
    Identifier     { fg = fg },
    Statement      { Keyword },
    Type           { Keyword },
    Directory      { fg = blue },
    Comment        { fg = fg.da(40) },

    LspInlayHint { fg = Comment.fg, bg = bg.li(10) },

    sym"@variable"              { fg = fg },
    sym"@comment"               { Comment },

    Constant               { fg = fg },
    sym"@constant"         { Constant },

    Property              { fg = purple },
    sym"@attribute"       { Property },
    sym"@tag.attribute"       { Property },
    sym"@property.fennel" { Property },

    String                 { fg = green },
    Number                 { fg = pink },
    sym"@boolean"          { Number },

    Namespace                 { fg = beige },
    sym"@type.qmljs"          { Namespace },

    Structural                { fg = blue, bold = false },
    Tag                       { Structural },
    -- sym"@type"                { Structural },
    sym"@keyword"             { Structural },
    sym"@keyword.type"        { Structural },

    sym"@tag.delimiter" { fg = Normal.fg.da(20) },

    HiddenFlow                 { fg = yellow },
    Function                   { HiddenFlow },
    sym"@function"             { HiddenFlow },
    sym"@function.call"        { HiddenFlow },
    sym"@function.method.call" { HiddenFlow },

    ControlFlow               { fg = orange, bold = true },
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

    FzfLuaNormal { MsgArea },
    -- FzfLuaFzfCursorLine { fg = white, bg = PmenuSel.bg },

    sym"@org.plan"            { Comment },
    sym"@org.keyword.done" { NonText },
    sym"@org.keyword.todo"    { fg = green, bold = true },
    sym"@org.headline.level1" { fg = blue, bold = true },
    sym"@org.headline.level2" { fg = pink.de(20).da(20), bold = true },
    sym"@org.headline.level3" { fg = pink.de(40).da(0), bold = true },
    sym"@org.headline.level4" { fg = blue.de(20).li(40), bold = true },
    sym"@org.agenda.day"      { sym"@org.headline.level3" },
    sym"@org.agenda.scheduled_past" { fg = yellow },
    sym"@org.agenda.scheduled" { NonText },
    sym"@org.agenda.deadline" { fg = orange, bold = true },
    sym"@org.timestamp.active" { fg = yellow },
    sym"@org.agenda.time_grid" { Comment },

    BlinkPairsOrange { fg = orange.sa(20).li(5) },
    BlinkPairsPurple { fg = pink.sa(20) },
    BlinkPairsBlue { fg = blue.sa(20).da(10) },
  }
end)

return theme
