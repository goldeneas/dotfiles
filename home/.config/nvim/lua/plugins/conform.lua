return {
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
		},

		default_format_opts = {
			lsp_format = "fallback",
		},
	},
}
