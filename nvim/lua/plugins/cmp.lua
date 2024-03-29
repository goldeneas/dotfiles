return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/vim-vsnip",
		"hrsh7th/cmp-vsnip",
		"hrsh7th/cmp-nvim-lsp-signature-help",
	},
	config = function()
		local cmp = require("cmp")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		cmp.event:on(
			"confirm_done",
			cmp_autopairs.on_confirm_done()
		)

		cmp.setup({
			-- Required snippet engine for cmp
			snippet = {
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body)
				end,
			},
			
			-- Sources for completion list
			-- Add buffer to suggest current file known-names in the list
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'vsnip' },
				{ name = 'nvim_lsp_signature_help' },
			}),

			-- Set mapping keys 
			mapping = {
				["<TAB>"] = cmp.mapping.select_next_item(),
				["<S-TAB>"] = cmp.mapping.select_prev_item(),
				["<CR>"] = cmp.mapping.confirm({ select = false })
			},
		})
	end
}
