require("tokyonight").setup({
  style = "storm", -- or "night", "moon", "day"
  transparent = true, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used in Nvim's :terminal
})

vim.cmd("colorscheme tokyonight-night")
