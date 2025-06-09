local light = false

local lush = require("lush")
local hsluv = lush.hsluv

local bg = hsluv(250, 0, 10)
-- local fg = hsluv(220, 10, 85)
local fg = bg.li(80).de(80)
local white = fg.li(80)
local yellow = hsluv(55, 80, 85)
local orange = hsluv(18, 95, 70)
local purple = hsluv(270, 50, 75)
local cyan = hsluv(170, 80, 85)
local green = hsluv(100, 70, 80)
local blue = hsluv(230, 70, 70)
local red = hsluv(10, 60, 60)

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

-- if light then
--   bg = bg_light
--   fg = fg_light
--   white = white_light
--   yellow = yellow_light
--   orange = orange_light
--   purple = purple_light
--   cyan = cyan_light
--   green = green_light
--   blue = blue_light
--   red = red_light
-- end

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

    RainbowDelimiterYellow       { fg = yellow.da(10).sa(60) },
    RainbowDelimiterOrange       { fg = orange.da(10).sa(60) },
    RainbowDelimiterViolet       { fg = purple.da(10).sa(60) },
    RainbowDelimiterCyan         { fg = cyan.da(10).sa(60) },
    RainbowDelimiterGreen        { fg = green.da(10).sa(60) },
    RainbowDelimiterBlue         { fg = blue.da(10).sa(60) },
    RainbowDelimiterRed          { fg = red.da(10).sa(60) },

    Cursor         { fg = blue.da(10), bg = white.li(5).sa(100), bold = true },
    Visual         { bg = blue.da(60) },
    MultiCursorCursor { bg = Visual.bg.li(30).de(20) },
    MultiCursorVisual { bg = Visual.bg.da(25) },
    CursorLine     { bg = bg.li(5) },
    LineNr         { fg = bg.li(40).de(60), bg = bg.li(4) },
    CursorLineNr   { fg = fg, bg = bg.li(4) },
    SignColumn     { bg = bg.li(4) },
    NonText        { fg = bg.li(10).de(10) },
    -- CursorLineSign { bg = bg.li(5).de(10) },
    Normal         { fg = fg, bg = bg },
    NormalFloat    { bg = bg.da(30) },
    FloatBorder    { fg = fg.da(50).sa(10), bg = NormalFloat.bg },
    -- FloatBorder    { fg = Normal.bg, bg = NormalFloat.bg },
    FloatTitle     { fg = FloatBorder.fg.li(80), bg = NormalFloat.bg, bold = true },
    StatusLine     { bg = bg.li(10), fg = fg.da(30) },
    StatusLineNC   { bg = StatusLine.bg, fg = StatusLine.fg.da(30) },
    Tabline        { fg = fg.da(30).de(30), bg = StatusLineNC.bg },
    TablineSel     { bg = bg, fg = fg },
    WinSeparator   { fg = bg.da(40), bg = bg.da(40) },
    VertSplit      { WinSeparator },
    EndOfBuffer    { fg = bg.li(10).de(10) },
    Pmenu          { bg = bg.da(50) },
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
    DiffAdd        { fg = green, bg = green.da(60).de(60) },
    DiffDelete     { fg = red, bg = red.da(60).de(60) },
    DiffText       { fg = blue, bg = blue.da(60).de(60) },
    DiffChange     { fg = DiffText.fg, bg = bg.li(10) },
    diffAdded      { DiffAdd },
    diffRemoved    { DiffDelete },
    diffLine       { DiffText },
    Added          { fg = green },
    Changed        { fg = yellow },
    Removed        { fg = red },

    -- Syntax
    Delimiter      { fg = fg.da(0).de(0) },
    Punctuation    { fg = fg },
    Keyword        { fg = fg },
    Operator       { Keyword },
    Special        { fg = orange },
    PreProc        { Special },
    Identifier     { fg = fg },
    Statement      { Keyword },
    Type           { Keyword },
    Directory      { fg = blue },
    Comment        { fg = fg.da(40) },

    sym"@variable"              { fg = fg },
    sym"@lsp.typemod.variable"  { fg = fg },

    sym"@variable.member"       { fg = blue },
    sym"@lsp.type.property"     { sym"@variable.member" },
    sym"@lsp.type.property.lua" { sym"@variable" },

    Constant               { fg = yellow },
    String                 { fg = green },
    Number                 { Constant },
    sym"@constant"         { Constant },
    sym"@constant.builtin" { Constant },

    -- Global                            { fg = purple },

    Structural { fg = purple },
    -- sym"@lsp.typemod.function.declaration"  { Structural },
    Tag { Structural },
    -- sym"@string.svelte" { Structural },
    sym"@keyword"             { Structural },
    -- sym"@keyword.function" { Structural },
    sym"@lsp.mod.global"      { Structural },
    sym"@lsp.typemod.variable.global" { Structural },
    -- sym"@lsp.mod.defaultLibrary" { Structural },

    Modifier                  { fg = cyan },
    sym"@lsp.type.modifier"   { Modifier },
    sym"@keyword.modifier"    { Modifier },

    HiddenFlow                { fg = blue },
    Function                  { HiddenFlow },
    sym"@function.call"       { HiddenFlow },
    sym"@lsp.type.method"     { HiddenFlow },
    sym"@function.builtin"    { HiddenFlow },

    ControlFlow               { fg = red },
    sym"@keyword.repeat"      { ControlFlow },
    sym"@keyword.conditional" { ControlFlow },
    sym"@keyword.return"      { ControlFlow },
    sym"@keyword.operator"    { ControlFlow },
    -- sym"@operator" { ControlFlow },
    -- sym"@punctuation.bracket"         { ControlFlow },

    State          { fg = red },
    sym"@lsp.mod.declaration" { fg = fg },
    sym"@lsp.typemod.variable.declaration" { fg = fg },

    sym"@string.escape" { Normal },

    sym"@keyword.type"      { Type },
    sym"@keyword.directive"   { Normal },
    sym"@keyword.import"    { Normal },

    sym"@none"              { Delimiter },
    sym"@type"              { Type },
    sym"@constructor"       { Type },
    sym"@constructor.lua"   { Delimiter },
    sym"@type.builtin"      { Normal },
    -- sym"@lsp.mod.defaultLibrary" { sym"@function.builtin" },
    sym"@character"         { fg = red },
    sym"@tag"               { Tag },
    sym"@tag.builtin"       { Tag },
    sym"@lsp.type.type.svelte"  { Tag },
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

    -- MiniPickMatchCurrent  { PmenuSel },
    MiniCursorWord        { bg = Normal.bg.li(5).de(10) },
    -- MiniCursorWordCurrent { bg = Normal.bg.li(10).de(10) },

    fugitiveHunk { fg = fg.da(30) },

    Patrick { fg = red.sa(100).ro(-10), bold = false },

    MiniPickPrompt { fg = FloatTitle.fg, bg = FloatTitle.bg },

    MiniIconsGrey   { fg = white.da(20) },
    MiniIconsYellow { fg = yellow },
    MiniIconsOrange { fg = orange },
    MiniIconsPurple { fg = purple },
    MiniIconsCyan   { fg = cyan },
    MiniIconsGreen  { fg = green },
    MiniIconsAzure  { fg = blue.sa(70).ro(20) },
    MiniIconsBlue   { fg = blue },
    MiniIconsRed    { fg = red },

    -- MiniIconsGrey   { fg = fg.da(30) },
    -- MiniIconsYellow { MiniIconsGrey },
    -- MiniIconsOrange { MiniIconsGrey },
    -- MiniIconsPurple { MiniIconsGrey },
    -- MiniIconsCyan   { MiniIconsGrey },
    -- MiniIconsGreen  { MiniIconsGrey },
    -- MiniIconsAzure  { MiniIconsGrey },
    -- MiniIconsBlue   { MiniIconsGrey },
    -- MiniIconsRed    { MiniIconsGrey },

  }
end)

return theme
