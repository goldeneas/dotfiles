return {
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    "stevearc/conform.nvim",
    opts = {
        default_format_opts = {
            lsp_format = "fallback",
        },
    },
}
