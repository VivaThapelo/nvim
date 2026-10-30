return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
	['*'] = {
	    inlay_hints = {
		enable = true,
	    }
	}
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
        "saghen/blink.cmp",
    },
    config = function()
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        vim.lsp.config("*", { capabilities = capabilities })
        vim.lsp.config("*", {
            settings = {
		         Lua = { diagnostics = { globals = { "vim" } } },
			 ['zls'] = {
			     enable_inlay_hints = true,
			     include_inlay_variable_type_hints = true,
    			     include_inlay_parameter_type_hints	= true,
			     include_inlay_function_like_return_type_hints = true,
			     include_inlay_struct_hints = true,
			 }
    	},
        })
        vim.lsp.enable({ "zls", "lua_ls", "pyright", "tsserver", "angularls" })
    end,
}
