return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "jdtls",
            "clangd",
            "lua_ls",
            "pyright",
            "superhtml",
        },
    },
    dependencies = {
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
    },
}
