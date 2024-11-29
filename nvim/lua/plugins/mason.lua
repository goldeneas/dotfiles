return {
    'williamboman/mason.nvim',
    dependencies = { 'williamboman/mason-lspconfig.nvim', 'neovim/nvim-lspconfig'},
	config = function()
		local mason = require("mason")
		local masonlsp = require("mason-lspconfig")
		local lspconfig = require("lspconfig")

		mason.setup()
		masonlsp.setup()

		-- Add nvim-cmp capabilities to lsp servers
		local cmplsp = require("cmp_nvim_lsp")
		local capabilities = cmplsp.default_capabilities()

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
