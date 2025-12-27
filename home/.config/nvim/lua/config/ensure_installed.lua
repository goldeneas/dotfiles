return {
    formatters = {
        go = { "goimports" },
        html = { "superhtml" },
    },
    linters = {
        go = { "golangcilint" },
    },
    lsp = {
        "jdtls",
        "gopls",
        "lua-language-server",
    },
    mason_aliases = {
        ["golangcilint"] = "golangci-lint",
    }
}
