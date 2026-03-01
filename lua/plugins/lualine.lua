return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "folke/trouble.nvim",
  },

  opts = function()
    -- Trouble-aware diagnostics component
    local trouble = require("trouble")
    local symbols = trouble.statusline({
      mode = "symbols",
      groups = {},
      title = false,
      filter = { range = true },
      format = "{kind_icon}{symbol.name:Normal}",
      hl_group = "lualine_c_normal",
    })

    return {
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        always_divide_middle = true,
        globalstatus = false,
      },

      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },

        lualine_c = {
          "filename",
          {
            symbols.get,
            cond = symbols.has,
          },
        },

        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn", "info", "hint" },
            symbols = {
              error = " ",
              warn  = " ",
              info  = " ",
              hint  = " ",
            },
          },
          "encoding",
          "filetype",
        },

        lualine_y = { "progress" },
        lualine_z = { "location" },
      },

      inactive_sections = {
        lualine_c = { "filename" },
        lualine_x = { "location" },
      },

      extensions = { "trouble" },
    }
  end,
}
