local utils = require("utils")

return {
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = utils.get_formatters_by_ft(),

        default_format_opts = {
            lsp_format = "fallback",
        },
    },
}
