local ensure_installed = require("config.ensure_installed")

return {
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = ensure_installed.formatters,

        default_format_opts = {
            lsp_format = "fallback",
        },
    },
}
