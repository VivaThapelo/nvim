return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        { "mason-org/mason.nvim", opts = { PATH = "append" } },
        "neovim/nvim-lspconfig",
        "saghen/blink.cmp",
    },
    config = function()
        local capabilities = require("blink.cmp").get_lsp_capabilities()
        local ts_inlay_hints = {
            includeInlayParameterNameHints = "all",
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
        }

        vim.lsp.config("*", { capabilities = capabilities })

        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                    hint = { enable = true },
                },
            },
        })

        vim.lsp.config("zls", {
            settings = {
                zls = {
                    inlay_hints_show_variable_type_hints = true,
                    inlay_hints_show_struct_literal_field_type = true,
                    inlay_hints_show_parameter_name = true,
                    inlay_hints_show_builtin = true,
                },
            },
        })

        vim.lsp.config("ts_ls", {
            settings = {
                typescript = { inlayHints = ts_inlay_hints },
                javascript = { inlayHints = ts_inlay_hints },
            },
        })

        vim.lsp.inlay_hint.enable(true)
        vim.lsp.enable({ "lua_ls", "zls", "ts_ls", "pyright" })
    end,
}
