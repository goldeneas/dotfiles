local api = require("api")

local ensure_installed = {
    formatters_by_ft = {
        go = { "goimports" },
        html = { "superhtml" },
    },
    linters_by_ft = {
    },
    lsp = {
        "jdtls",
        "gopls",
        "lua-language-server",
        "vscode-spring-boot-tools",
        "clangd",
    },
    dap_adapters = {
        "java-debug-adapter",
        "java-test",
    },
    parsers = {
        "rust", "c", "python", "html", "javascript", "css",
        "zig", "markdown", "java", "go", "dart",
    },
    mason_aliases = {
    }
}

api.install_tools(ensure_installed)
