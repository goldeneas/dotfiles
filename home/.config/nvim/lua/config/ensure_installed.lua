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
        "vscode-spring-boot-tools",
        "clangd",
    },
    parsers = {
        "rust", "c", "python", "html", "javascript", "css",
        "zig", "markdown", "java", "go", "dart",
    },
    mason_aliases = {
    }
}
