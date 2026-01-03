return {
    formatters = {
        go = { "goimports" },
        html = { "superhtml" },
    },
    linters = {
    },
    lsp = {
        "jdtls",
        "gopls",
        "lua-language-server",
    },
    parsers = {
        "rust", "c", "python", "html", "javascript", "css",
        "zig", "markdown", "java", "go",
    },
    mason_aliases = {
        ["golangcilint"] = "golangci-lint",
    }
}
