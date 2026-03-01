require('blink.cmp').setup({
  fuzzy = { implementation = "lua" },
  enabled = function()
    -- Disable in cmdline/search mode
    return vim.bo.buftype ~= 'prompt' and vim.fn.getcmdline() == ''
  end-- ...
})
