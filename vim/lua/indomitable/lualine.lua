-- Reference: https://github.com/nvim-lualine/lualine.nvim/wiki/Writing-a-theme
local palette = require('indomitable.palette')
return {
  normal = {
    a = { fg = 'Black', bg = palette.punctuation },
    b = { fg = 'LightGray', bg = palette.punctuation_dim },
    c = { fg = palette.foreground, bg = palette.punctuation_dimmer },
  },
  insert = {
    a = { fg = 'Black', bg = palette.strings, bold = true, },
    -- b = { fg = 'LightGray', bg = palette.punctuation_dim },
    -- c = { fg = 'White', bg = palette.punctuation_dimmer },
  },
  visual = {
    a = { fg = 'Black', bg = palette.functions, bold = true },
    -- b = { fg = 'LightGray', bg = palette.punctuation_dim },
    -- c = { fg = 'White', bg = palette.punctuation_dimmer },
  },
  replace = {
    a = { fg = 'Black', bg = palette.keywords, bold = true },
    -- b = { fg = 'LightGray', bg = palette.punctuation_dim },
    -- c = { fg = 'White', bg = palette.punctuation_dimmer },
  },
  command = {
    a = { fg = 'Black', bg = palette.foreground, bold = true },
    -- b = { fg = 'LightGray', bg = palette.punctuation_dim },
    -- c = { fg = 'White', bg = palette.punctuation_dimmer },
  },
  -- inactive = {
  --   a = { fg = 'Black', bg = palette.punctuation },
  --   b = { fg = 'LightGray', bg = palette.punctuation_dim },
  --   c = { fg = 'White', bg = palette.punctuation_dimmer },
  -- },
}
