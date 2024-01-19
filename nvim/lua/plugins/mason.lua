return {
    'williamboman/mason.nvim',
    dependencies = { 'williamboman/mason-lspconfig.nvim', 'neovim/nvim-lspconfig'},
	config = function()
		local mason = require("mason")
		local masonlsp = require("mason-lspconfig")
		local lspconfig = require("lspconfig")

		mason.setup()
		masonlsp.setup()

		-- This automatically sets up servers for us
		-- Check :h mason-lsp -> Automatic Server Setup
		masonlsp.setup_handlers ({
        function (server_name)
            lspconfig[server_name].setup {}
        end,
		})
	end,
}
