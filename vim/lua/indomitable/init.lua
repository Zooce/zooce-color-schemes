local theme = require('indomitable.theme')
local M = {}

function M.load()
  vim.o.termguicolors = true
  if vim.g.colors_name then
    vim.cmd [[hi clear]]
  end
  vim.o.background = 'dark'
  vim.g.colors_name = 'indomitable'

  for group, hl in pairs(theme) do
    vim.api.nvim_set_hl(0, group, hl)
  end
end

return M

-- vim: ts=2 sts=2 sw=2 et
