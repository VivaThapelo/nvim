return {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
        "saghen/blink.cmp",
    },
    config = function()
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        vim.lsp.config("*", { capabilities = capabilities })
        vim.lsp.config("lua_ls", {
            settings = { Lua = { diagnostics = { globals = { "vim" } } } },
        })
        vim.lsp.enable({ "zls", "lua_ls", "pyright", "ts_ls", "angular_ls" })
    end,
}
