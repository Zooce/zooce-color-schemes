local palette = require('indomitable.palette')
return {
  Normal = { fg = palette.foreground, bg = palette.background },
  Pmenu = { fg = palette.foreground }, --, bg = palette.line_highlight },

  Foreground = { fg = palette.foreground },
  Identifier = { link = 'Foreground' },
  Type = { link = 'Foreground' },
  Title = { link = 'Foreground' },
  ['@lsp.typemod.type'] = { link = 'Foreground' },
  NvimInternalError = { link = 'Error' },
  RedrawDebugClear = { fg = 'Black', bg = 'Yellow' },
  Search = { fg = palette.line_highlight, bg = palette.constants },
  IncSearch = { link = 'Search' },

  Underlined = { fg = palette.foreground, underline = true },

  -- punctuation
  Punctuation = { fg = palette.punctuation },
  Conceal = { link = 'Punctuation' },
  ['@punctuation'] = { link = 'Punctuation' },
  ['@attribute'] = { link = 'Punctuation' },
  ['@tag.delimiter'] = { link = 'Punctuation' },
  ['xmlTag'] = { link = 'Punctuation' },
  ['xmlProcessingDelim'] = { link = 'Punctuation' },
  ['@constructor.lua'] = { link = 'Punctuation' },

  -- keywords
  Statement = { fg = palette.keywords },
  StorageClass = { link = 'Statement' },
  PreProc = { link = 'Statement' },
  ['@include'] = { link = 'Statement' },
  ['@type.builtin'] = { link = 'Statement' },
  ['@type.toml'] = { link = 'Statement' },
  ['@tag'] = { link = 'Statement' },
  ['xmlTagName'] = { link = 'Statement' },
  ['@type.css'] = { link = 'Statement' },
  ['@type.qualifier'] = { link = 'Statement' },
  ['@text.title.1.markdown'] = { link = 'Statement' },
  ['@text.title.2.markdown'] = { link = 'Statement' },
  ['@text.title.3.markdown'] = { link = 'Statement' },
  ['@text.title.4.markdown'] = { link = 'Statement' },
  ['@text.title.5.markdown'] = { link = 'Statement' },
  ['@text.title.6.markdown'] = { link = 'Statement' },
  ['@text.title.1.marker.markdown'] = { link = 'Statement' },
  ['@text.title.2.marker.markdown'] = { link = 'Statement' },
  ['@text.title.3.marker.markdown'] = { link = 'Statement' },
  ['@text.title.4.marker.markdown'] = { link = 'Statement' },
  ['@text.title.5.marker.markdown'] = { link = 'Statement' },
  ['@text.title.6.marker.markdown'] = { link = 'Statement' },
  ['@lsp.type.keyword'] = { link = 'Statement' },
  ['@lsp.type.operator'] = { link = 'Statement' },
  ['@lsp.type.type.zig'] = { link = 'Statement' },
  ['@lsp.type.keywordLiteral.zig'] = { link = 'Statement' },

  -- functions
  Function = { fg = palette.functions },
  ['@constructor'] = { link = 'Function' },
  ['@function.builtin'] = { link = 'Function' },
  ['@function.call'] = { link = 'Function' },
  ['@tag.attribute'] = { link = 'Function' },
  ['xmlAttrib'] = { link = 'Function' },
  ['@text.reference.markdown_inline'] = { link = 'Function' },
  helpHyperTextJump = { link = 'Function' },

  -- strings
  String = { fg = palette.strings },
  ['@text.quote'] = { link = 'String' },
  ['@text.uri'] = { fg = palette.strings, underline = true },

  -- constants
  Constant = { fg = palette.constants },
  Macro = { link = 'Constant' },
  ['@constant.builtin'] = { link = 'Constant' },
  ['@function.macro'] = { link = 'Constant' },
  ['@string.escape'] = { link = 'Constant' },
  ['@variable.builtin'] = { link = 'Constant' },
  ['@text.literal'] = { link = 'Constant' },
  ['xmlEntity'] = { link = 'Constant' },
  ['xmlEntityPunct'] = { link = 'Constant' },

  -- comments
  Comment = { fg = palette.comments },
  ['@string.documentation'] = { link = 'Comment' },
  ['@text.uri.markdown_inline'] = { link = 'Comment' },
  ['@text.reference.markdown'] = { link = 'Comment' },
  Todo = { fg = palette.line_highlight, bg = palette.foreground, bold = true },
  ['@text.todo'] = { link = 'Todo' },

  -- other
  Special = { fg = palette.other },
  ['@constant'] = { link = 'Special' },
  ['@lsp.type.builtin.zig'] = { link = 'Special' },

  -- editor
  CursorLine = { bg = palette.line_highlight },
  CursorLineNr = { link = 'CursorLine', bold = true },
  CursorColumn = { bg = palette.punctuation_dimmer },
  ColorColumn = { bg = palette.punctuation_dimmer },
  SignColumn = { link = 'Normal' },
  LineNr = { fg = palette.punctuation_dim },
  Visual = { bg = palette.selection },
  VisualNC = { bg = palette.selection_dim },
  MatchParen = { fg = palette.line_highlight, bg = palette.inserted, sp = palette.inserted, bold = true, underline = true, reverse = true, standout = true },
  StatusLine = { fg = 'White', bg = palette.punctuation_dimmer },

  -- diagnostics
  DiagnosticOk = { fg = palette.inserted },
  DiagnosticHint = { fg = palette.constants },
  DiagnosticInfo = { fg = palette.foreground },
  DiagnosticWarn = { fg = palette.changed }, --, bg = palette.line_highlight },
  DiagnosticError = { fg = palette.deleted }, --, bg = palette.line_highlight },
  DiagnosticUnnecessary = { fg = palette.foreground, bg = palette.comments },

  DiagnosticUnderlineOk =  { bg = palette.inserted, fg = 'Black', bold = true },
  DiagnosticUnderlineWarn = { bg = palette.changed, fg = 'Black', bold = true },
  DiagnosticUnderlineError = { bg = palette.deleted, fg = 'White', bold = true },

  NonText = { fg = palette.punctuation_dim },

  -- sign column status
  DiffAdd = { fg = palette.inserted, },
  DiffChange = { fg = palette.changed, },
  DiffDelete = { fg = palette.deleted, },
  DiffText = { fg = palette.foreground, },

  -- indent blank line plugin
  IndentBlanklineChar = { fg = palette.punctuation_dimmer },
  IndentBlanklineSpaceChar = { fg = palette.punctuation_dimmer },
  IndentBlanklineSpaceCharBlankline = { fg = palette.punctuation_dimmer },
  IndentBlanklineContextChar = { fg = palette.punctuation_dim },
  IndentBlanklineContextStart = { fg = palette.punctuation_dim },
}

-- vim: ts=2 sts=2 sw=2 et
