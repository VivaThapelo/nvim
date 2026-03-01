vim.keymap.set('i', '<CR>', function()
  return require('blink.cmp').accept()
end, { expr = true })
