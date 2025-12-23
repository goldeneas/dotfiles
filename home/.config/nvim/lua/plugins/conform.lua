return {
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            go = { "goimports", "gofumpt" },
            html = { "superhtml" },
        },

        default_format_opts = {
            lsp_format = "fallback",
        },
    },
}
