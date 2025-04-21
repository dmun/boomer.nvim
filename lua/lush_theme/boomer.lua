local lush = require("lush")
local hsluv = lush.hsluv

local fg = hsluv(60, 30, 85)
local bg = hsluv(140, 40, 5)
local yellow = hsluv(65, 100, 80)
local orange = hsluv(30, 100, 60)
local green = hsluv(120, 90, 70)
local blue = hsluv(239, 90, 70)
local red = hsluv(0, 90, 60)

---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- stylua: ignore start

    -- UI
    Cursor         { bg = yellow },
    CursorLine     { bg = bg.li(10).de(10) },
    Visual         { bg = bg.li(20).de(20) },
    Normal         { fg = fg, bg = bg },
    NormalFloat    { bg = bg.da(40).de(10) },
    FloatBorder    { fg = fg.da(30).de(30), bg = NormalFloat.bg },
    FloatTitle     { fg = FloatBorder.fg.li(30), bg = NormalFloat.bg, bold = true },
    StatusLine     { bg = fg.da(10), fg = bg },
    StatusLineNC   { bg = StatusLine.bg.da(20), fg = bg },
    Tabline        { bg = StatusLine.bg.da(20) },
    TablineSel     { bg = bg, fg = fg, bold = true },
    WinSeparator   { fg = bg.li(60).de(80) },
    Pmenu          { bg = bg.li(20).de(10) },
    PmenuSel       { fg = bg, bg = yellow },
    QuickFixLine   { PmenuSel },

    Title { fg = red, bold = true },
    DiagnosticInfo { fg = blue.li(20).de(20) },

    -- Syntax
    Delimiter      { fg = fg.de(40) },
    Punctuation    { fg = fg },
    Operator       { fg = fg },
    Keyword        { fg = orange },
    Special        { fg = fg },
    Constant       { fg = yellow },
    Number         { fg = green },
    String         { fg = green },
    Identifier     { fg = fg },
    Function       { fg = fg },
    Statement      { fg = fg },
    Type           { fg = orange },
    Directory      { fg = blue },
    Comment        { fg = blue.da(20) },

    sym"@variable" { fg = fg },

    -- Plugins
    CopilotSuggestion { fg = bg.li(50).de(50) },

    -- stylua: ignore end
  }
end)

return theme
