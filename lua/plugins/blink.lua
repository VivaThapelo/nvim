return {
  'neovim/nvim-lspconfig',
  dependencies = { 'saghen/blink.cmp', "rafamadriz/friendly-snippets" },
  lazy = false,
  opts = {
    keymap = {
	preset = "none",
    	['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
	['<C-e>'] = { 'hide', 'fallback' },
	['<CR>'] = { 'accept', 'fallback' },

	['<Tab>'] = { 'snippet_forward', 'fallback' },
	['<S-Tab>'] = { 'snippet_backward', 'fallback' },

	['<Up>'] = { 'select_prev', 'fallback' },
	['<Down>'] = { 'select_next', 'fallback' },
	['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
	['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

	['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
	['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

	['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
    },
    fuzzy = { implementation = 'lua' },
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
