return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = { "jdtls", "clangd" },
    },
    dependencies = {
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
    },
}
