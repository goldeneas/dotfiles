return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "saghen/blink.cmp"
    },
	config = function()
		local mason = require("mason")
		local masonlsp = require("mason-lspconfig")
		local lspconfig = require("lspconfig")

		mason.setup()
		masonlsp.setup()

		-- Add blink capabilities to lsp servers
        local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- This automatically sets up servers for us
		-- Check :h mason-lsp -> Automatic Server Setup
		masonlsp.setup_handlers ({
			function (server_name)
                if server_name == "jdtls" then return end

				lspconfig[server_name].setup {
					capabilities = capabilities
				}
			end, 
		})
	end,
}
