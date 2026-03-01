return {
  'neovim/nvim-lspconfig',
  dependencies = { 'saghen/blink.cmp' },
  opts = {
    fuzzy = { implematation = 'lua' },
     servers = {
      lua_ls = {
        -- 'server' (the key) is already 'lua_ls'
        settings = {
          Lua = { diagnostics = { globals = { 'vim' } } }
        }
      },
      zls = {},
      pyright = {},
    }
  },
  config = function(_, opts)
    -- Loop through the servers
    for server_name, server_config in pairs(opts.servers) do
      -- 1. Register the config using the STRING name
      -- In Neovim 0.11, vim.lsp.config(name, config) registers it
      vim.lsp.config(server_name, server_config)
      
      -- 2. Enable the server
      vim.lsp.enable(server_name)
    end
  end,
}

