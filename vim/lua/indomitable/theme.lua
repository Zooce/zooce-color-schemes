local palette = require('indomitable.palette')
return {
  Normal = { fg = palette.foreground, bg = palette.background },
  Pmenu = { link = 'Normal' },

  Foreground = { fg = palette.foreground },
  Identifier = { link = 'Foreground' },
  Type = { link = 'Foreground' },
  Title = { link = 'Foreground' },
  ['@lsp.typemod.type'] = { link = 'Foreground' },

  Underlined = { fg = palette.foreground, underline = true },

  -- punctuation
  Punctuation = { fg = palette.punctuation },
  ['@punctuation'] = { link = 'Punctuation' },
  ['@attribute'] = { link = 'Punctuation' },
  ['@tag.delimiter'] = { link = 'Punctuation' },
  ['xmlTag'] = { link = 'Punctuation' },
  ['xmlProcessingDelim'] = { link = 'Punctuation' },
  ['@text.title.1.marker.markdown'] = { link = 'Statement' },
  ['@text.title.2.marker.markdown'] = { link = 'Statement' },
  ['@text.title.3.marker.markdown'] = { link = 'Statement' },
  ['@text.title.4.marker.markdown'] = { link = 'Statement' },
  ['@text.title.5.marker.markdown'] = { link = 'Statement' },
  ['@text.title.6.marker.markdown'] = { link = 'Statement' },

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
  ['@text.todo'] = { fg = palette.foreground, bg = palette.comments, bold = true },

  -- other
  Special = { fg = palette.other },
  ['@constant'] = { link = 'Special' },
  ['@lsp.type.builtin.zig'] = { link = 'Special' },

  -- editor
  CursorLine = { bg = palette.line_highlight },
  CursorLineNr = { link = 'CursorLine', bold = true },
  CursorColumn = { link = 'CursorLine' },
  SignColumn = { link = 'CursorLine' },
  LineNr = { fg = palette.punctuation_dim, bg = palette.line_highlight },
  Visual = { bg = palette.selection },
  VisualNC = { bg = palette.selection_dim },

  -- diagnostics
  DiagnosticOk = { fg = palette.inserted, bg = palette.line_highlight },
  DiagnosticHint = { fg = palette.foreground, bg = palette.line_highlight },
  DiagnosticInfo = { fg = palette.foreground, bg = palette.line_highlight },
  DiagnosticWarn = { fg = palette.changed, bg = palette.line_highlight },
  DiagnosticError = { fg = palette.deleted, bg = palette.line_highlight },
  DiagnosticUnnecessary = { fg = palette.foreground, bg = palette.comments },

  DiagnosticUnderlineOk =  { bg = palette.inserted, fg = 'Black', bold = true },
  DiagnosticUnderlineWarn = { bg = palette.changed, fg = 'Black', bold = true },
  DiagnosticUnderlineError = { bg = palette.deleted, fg = 'White', bold = true },

  NonText = { fg = palette.punctuation_dim },

  -- sign column status
  DiffAdd = { fg = palette.inserted, bg = palette.line_highlight },
  DiffChange = { fg = palette.changed, bg = palette.line_highlight },
  DiffDelete = { fg = palette.deleted, bg = palette.line_highlight },
  DiffText = { fg = palette.foreground, bg = palette.deleted },


  -- indent blank line plugin
  IndentBlanklineChar = { fg = palette.punctuation_dimmer },
  IndentBlanklineSpaceChar = { fg = palette.punctuation_dimmer },
  IndentBlanklineSpaceCharBlankline = { fg = palette.punctuation_dimmer },
  IndentBlanklineContextChar = { fg = palette.punctuation_dim },
  IndentBlanklineContextStart = { fg = palette.punctuation_dim },
}

-- vim: ts=2 sts=2 sw=2 et
