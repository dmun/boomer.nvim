local lush = require("lush")
local hsluv = lush.hsluv

local fg = hsluv(60, 30, 75)
local bg = hsluv(185, 80, 12)
local white = fg.li(60)
local yellow = hsluv(65, 100, 75)
local orange = hsluv(20, 100, 55)
local green = hsluv(110, 100, 70)
local blue = hsluv(240, 90, 70)
local red = hsluv(10, 90, 60)

---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- stylua: ignore start

    Cursor         { bg = white },
    CursorLine     { bg = bg.li(5).de(10) },
    LineNr         { fg = bg.li(15).de(20) },
    CursorLineNr   {
      fg = yellow.da(10).sa(10),
      -- bg = bg.li(5).de(10),
    },
    -- CursorLineSign { bg = bg.li(5).de(10) },
    Visual         { bg = bg.li(20).de(20) },
    Normal         { fg = fg, bg = bg },
    NormalFloat    { bg = bg.da(40).de(10) },
    FloatBorder    { fg = fg.da(30).de(30), bg = NormalFloat.bg },
    FloatTitle     { fg = FloatBorder.fg.li(30), bg = NormalFloat.bg, bold = true },
    StatusLine     { bg = bg.da(40).de(10), fg = fg },
    StatusLineNC   { bg = bg.da(20), fg = fg.da(20).de(20) },
    Tabline        { fg = bg, bg = StatusLineNC.bg },
    TablineSel     { bg = bg, fg = fg, bold = true },
    WinSeparator   { FloatBorder },
    Pmenu          { bg = bg.li(20).de(40) },
    PmenuSel       { bg = yellow.da(60).sa(60) },
    PmenuSbar      { bg = Pmenu.bg.da(20).sa(20) },
    PmenuThumb     { bg = Pmenu.bg.li(20).de(20) },
    QuickFixLine   { PmenuSel },
    Title          { fg = red, bold = true },
    DiagnosticInfo { fg = blue.li(20).de(20) },
    DiagnosticUnnecessary { fg = fg.da(40).de(40) },

    -- Git
    diffAdded      { bg = green.da(50).de(50) },
    diffRemoved    { bg = red.da(50).de(50) },
    Added          { fg = green },
    Changed        { fg = yellow },
    Removed        { fg = red },

    -- Syntax
    Delimiter      { fg = fg.de(40) },
    Punctuation    { fg = fg },
    Operator       { fg = fg },
    Keyword        { fg = white },
    Special        { fg = fg },
    Constant       { fg = yellow },
    Number         { fg = yellow },
    PreProc        { Constant },
    String         { fg = green },
    Identifier     { fg = fg },
    Function       { fg = fg },
    Statement      { Keyword },
    Type           { fg = fg },
    Directory      { fg = blue },
    Comment        { fg = blue.da(20).sa(20) },

    sym"@variable" { fg = fg },
    sym"@lsp.type.modifier" { fg = red },
    sym"@keyword.modifier"  { fg = red },
    sym"@type"              { Type },
    sym"@type.builtin"      { Keyword },
    sym"@function"          { Function },
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
